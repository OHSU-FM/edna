module StatsHelper

  def show_stats(_attribute_name, _value, _params=nil)
    unless _params
      _params = params
    end

    id = _params[:id]

    entity_name = case @year
                  when 2006
                    'y1_graduate_responses'
                  when 2007
                    'y2_graduate_responses'
                  when 2008
                    'y3_graduate_responses'
                  when 2009
                    'y4_graduate_responses'
                  when 2010
                    'y5_graduate_responses'
                  when 2011
                    'y6_graduate_responses'
                  when 2012
                    'y7_graduate_responses'
                  else
                    raise "Invalid action: #{_params[:action] || ''}" unless entity_name
                  end

    begin
      a = MetaAttribute::MetaAttributeStatistic.where({
        :subset_id => (!id || id == '0' ? 'A' : id),
        :entity_name => entity_name,
        :attribute_name => _attribute_name
      }).first

      if a.is_continuous
        return ("#{a.mean.round(1)}" + '&nbsp;' +
                '<span class="hint">' +
                "(CI: #{a.ci_lower.round(1)} - #{a.ci_upper.round(1)})" +
                '</span>').html_safe
      end

      v = MetaAttribute::MetaAttributeValue.where({
        :meta_attribute_statistic_id => a.id, :value => _value.to_f
      }).first

      p = (
        (!id || id == '0' ? (v.count / a.count) : (v.subset_count / a.subset_count)
        ).round(2 + 1) * 100.0)

      return colorize_span(p, 0, 100) { "#{p}%" }.html_safe

    rescue

      return 'N/A'

    end

  end


  def errors_for(_attribute_name)

    return ''

  end

  def colorize(n, low, high)
    factor = (high > 0 ? 1.0 * (n - low) / high : 0)
    intensity = 150 * factor
    color = sprintf('#%02x%02x%02x', 160 - intensity, intensity, 64)
  end


end


