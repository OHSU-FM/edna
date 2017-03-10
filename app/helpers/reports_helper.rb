module ReportsHelper

  def colorize(n, low, high)
    #auto color for number (n) between low and high values
    factor = (high > 0 ? 1.0 * (n - low) / high : 0)
    intensity = 92 * factor
    color = sprintf('#%02x%02x%02x', 92 - intensity, intensity, 64)
  end


  def colorize_span(n, low, high)
    color = colorize(n, low, high)
    return '<span style="color: ' + h(color) + ';">' \
      + (block_given? ? yield.to_s : '') + '</span>'
  end


  def percent_bar(n, low, high, total_width, options = {})
    factor = (high > 0 ? 1.0 * (n - low) / high : 0)
    # Round to 1 decimal place (removes floating point errors)
    width = (factor * total_width * 10).to_i / 10.0
    return '<div class="percent-bar" style="background-color: ' \
      + (options[:color] || colorize(n, low, high)) + '; width: ' \
      + h(sprintf('%.1f', width)) \
      + (options[:use_percentages] ? '%' : 'em') + ';">' \
      + (block_given? ? yield.to_s : '&nbsp;') + '</div>'
  end


  def get_color(_i, _value = nil)
    if ([ 777, 888, 999 ].include?(_value.to_i))
      return '#eee;color:#333'; # set font color as well
    elsif ([ 0 ].include?(_value.to_i))
      return '#383838'
    else
      table = [
        '#00c040', '#c00040', '#9051a4', '#0040c0', '#f5a54e', '#383838'
      ]
      return table[_i % table.length-1]
    end
  end

  def link_to_stats(_controller, _question_id = nil, _text = 'Show This Question on Original Survey Instrument')

    controller = _controller.to_s

    controller_map = {
      'y2_graduate_responses' => '2007',
      'y3_graduate_responses' => '2008',
      'y4_graduate_responses' => '2009',
      'y5_graduate_responses' => '2010',
      'y6_graduate_responses' => '2011',
      'y7_graduate_responses' => '2012'
    }

    return nil unless controller_map.keys.include?(controller)

    return link_to(_text,
                   show_stat_path(:id=>params[:id],:year=>controller_map[controller], :anchor=>_question_id),
                   :class=>'btn btn-default btn-xs show-modal-nav-reports')
  end


  def has_stats_view(_controller)
    return (link_to_stats(_controller) != nil)
  end

  #
  # MasCategory
  #  - Category
  #  - SubCategories
  #    -
  #    -
  #    -
  #  - Statistics
  #    -
  #    -
  #    -
  #
  class MasSorter
    #
    MAX_SUBCATEGORIES = 8
    attr_accessor :order
    attr_reader :depth

    def initialize xcategory=nil, depth=0, all_sorters=[]
      # Crash if we recurse more than 500 times
      raise "crash me" if caller.length > 500

      @depth=depth
      self.category = xcategory
      @all_sorters = all_sorters
      return
    end

    # The name of the category
    def category
      @category ||= ''
    end

    # Setter for category, limit the size of the category based on depth, using ':' as delimiter
    def category= arg
      cat_arr = arg.to_s.split(':')[0..@depth-1] || []
      @category = cat_arr.join(':').to_s
    end

    # TODO: Debug, remove
    def to_s
      "\n<#{self.class.name}
  :category=>\"#{category}\" :depth=>#{@depth} :all_sorters:=>#{@all_sorters.size}
  :sub_sorters=>#{sub_sorters.length} :statistics=>#{statistics.count}>"
  end

      # What should be displayed in scroll-spy
      def title
        @category.split(':')[@depth-1].to_s.strip
      end

      # Sanitize category for use as a html node id value
      def sanitized_category
        return category.underscore.gsub(/ /, '_').gsub(/[^a-z_0-9]/,'')
      end

      # Sub categories
      def sub_sorters
        @sub_sorters ||= []
      end

      # All Categories
      def all_sorters opts={}
        if opts[:depth].to_i > 0
          return @all_sorters.
            select{|sorter|sorter.depth==opts[:depth]}.
            sort_by{|sorter|sorter.order}
        end
        return @all_sorters
      end

      # Does this cat_name belong to us or in a child??
      def category_matches? cat_name
        return cat_name.include?(category) || category == cat_name
      end

      # Find all sub_sorters that are related to this cat_name
      def find_sorters cat_name
        sub_sorters.select{|ss|ss.category_matches?(cat_name)}
      end

      #
      def add_statistic stat
        # cat name
        cat_name = stat.category.to_s               # name alias for category
        cat_arr = cat_name.split(':')               # Split of

        # This stat has the exact same category as us, lets add it
        if category == cat_name
          # This question belongs in this bin
          statistics.push stat
          return
        end

        # Add the statistic to a sub sorter if
        all_sorters.each do |sorter|
          # Do we have any sub_sorters with the same title?
          if sorter.category == cat_name
            sorter.add_statistic stat
            return
          end
        end

        # Add the statistic to a sub sorter if
        find_sorters(cat_name).each do |sorter|
          if sorter.sub_sorters.size < MAX_SUBCATEGORIES
            # Do we have any sub_sorters with the same title?
            sorter.add_statistic stat
            return
          end
        end

        # We need to create a sub sorter
        sub_sorter = self.class.new(cat_name, @depth+1, @all_sorters)
        sub_sorter.add_statistic stat
        sub_sorters.push sub_sorter
        @all_sorters.push sub_sorter
      end

      # add many statistics to this sorter
      # - Possibly add them recursively
      def add_statistics stats_arr
        stats_arr.each do |stats|
          add_statistic stats
        end
        return
      end

      # List of all statistics in this sorter
      def statistics
        @statistics ||= []
      end

      # Add roman numerals to categories with duplicate names
      def count_categories!
        counts = Hash.new 0
        modify = []
        @all_sorters.each do |sorter|
          counts[sorter.category] += 1
          if @all_sorters.count{|xx|xx.category == sorter.category} > 1
            modify.push [sorter, counts[sorter.category]]
          end
        end
        modify.each do |sorter, count|
          sorter.category += " #{count.to_roman}"
        end
      end

    end

  end
