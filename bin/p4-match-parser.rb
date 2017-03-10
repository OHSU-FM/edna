#!/usr/bin/env ruby

require 'csv'

module P4
  module Match
    class Parser
      def initialize(_site = nil, _track = nil, _pool = nil)
        row = 0
        headers = nil

        site = (_site || 'Unknown')
        track = ([ nil, '' ].include?(_track) ? nil : _track)
        pool = ([ nil, '' ].include?(_pool) ? nil : _pool)

        map = {
          'lcme_us_senior_applications' =>
            /#\s*LCME\/US Senior Applications/i,
          'do_applications' =>
            /#\s*DO Applications/i,
          'img_us_applications' =>
            /#\s*IMG Applications\s*-\s*US citizen/i,
          'img_nonus_applications' =>
            /#\s*IMG Applications\s*-\s*Non-citizen/i,
          'total_applications' =>
            /TOTAL # APPLICATIONS/i,
          'interviews_completed' =>
            /#\s*Interviews Completed/i,
          'applicants_ranked' =>
            /#\s*Applicants Ranked/i,
          'positions_offered_in_match' =>
            /#\s*Positions offered in the match/i,
          'positions_filled_in_match_count' =>
            /#\s*Positions filled in the match/i,
          'positions_filled_in_match_pct' =>
            /%\s*Positions filled in the match/i,
          'positions_filled_outside_match' =>
            /#\s*Positions filled before match day outside the match/i,
          'positions_filled_through_scramble_or_after' =>
            /#\s*Positions filled through scramble or added after match day/i,
          'ranks_to_fill' =>
            /Ranks to fill \(only for those who fill\)/i,
          'lcme_us_seniors_count' =>
            /#\s*(?:LCME\/)?US Senior(?:s|\s*Applications\s+\(Private\s+and\s+Public\))\s*/i,
          'lcme_us_seniors_pct' =>
            /%\s*LCME\/US Seniors/i,
          'do_count' =>
            /#\s*DO'?s/i,
          'do_pct' =>
            /%\s*DO'?s/i,
          'img_us_citizen_count' =>
            /#\s*IMG\s+-\s*US\s+citizen\s*/i,
          'img_us_citizen_pct' =>
            /%\s*IMG\s+-\s*US\s+citizen\s*/i,
          'img_nonus_citizen_count' =>
            /#\s*IMG\s+-\s+Non-citizen\s*/i,
          'img_nonus_citizen_pct' =>
            /%\s*IMG\s+-\s+Non-citizen\s*/i,
          'others_count' =>
            /#\s*Others/i,
          'others_pct' =>
            /%\s*Others/i,
          'prior_us_grads_count' =>
            /#\s*Prior\s+US\s+Graduates/i,
          'prior_us_grads_pct' =>
            /%\s*Prior\s+US\s+Graduates/i,
          'total_1yr_residents_jul1' =>
            /Total\s+1st\s+year\s+residents\s+on\s+july\s+1/i,
          'lcme_grads_jul1' =>
            /#\s+LCME\s+grads(?:\s+on\s+july\s+1)?/i,
          'do_grads_jul1' =>
            /#\s+DO\s+grads(?:\s+on\s+july\s+1)?/i,
          'us_citizen_img_grads_jul1' =>
            /#\s+US\s+Citizen\s+IMG\s+grads(?:\s+on\s+july\s+1)?/i,
          'nonus_citizen_img_grads_jul1' =>
            /#\s+Non-US\s+Citizen\s+IMG\s+grads(?:\s+on\s+july\s+1)?/i,
          'national_canadian_school_applications' =>
            /#\s+Canadian\s+School\s+Applications/i,
          'national_usg_applications' =>
            /#\s+Total\s+USG\s+Applications\s+\(Private,\s+Public,\s+DO\s+and\s+Canadian\)/i,
          'national_img_total_applications' =>
            /#\s+IMG\s+Applications\s+\(US\s+citizen\s+and\s+Non-US\s+Citizen\)\s*/i,
          'national_total_fm_residency_programs' =>
            /\s*Total\s+#\s+of\s+FM\s+Residency\s+Programs\s*/i
          #'national_lcme_grads' =>
          #  /#\s*LCME\s+grads/i,
          #'national_do_grads' =>
          #  /#\s*DO\s+grads/i,
          #'national_us_citizen_img_grads' =>
          #  /#\s*US\s+Citizen\s*IMG\s+grads/i,
          #'national_nonus_citizen_img_grads' =>
          #  /#\s*Non-US\s+Citizen\s+IMG\s+grads/i,
        }

        $stdout.puts 'begin;'

        CSV::Reader.parse(STDIN) { |r|
          if (row == 2)
            headers = r.slice(4, 7)
          elsif (row > 2)
            measure = nil
            map.each { |name, re|
              r[0] = (r[0] || r[2])
              measure = name if (re.match(r[0]))
            }
            unless (measure)
              $stderr.puts "NOTICE: Unknown measure name: #{r[0].inspect}" \
                unless (r[0] == nil)
              next
            end
            headers.each_index { |i|
              value = r[i + 4]
              if (value == '999')
                $stderr.puts "WARNING: Magic value '999' found for #{measure.inspect}"
              elsif (value == '888')
                $stderr.puts "WARNING: Magic value '888' found for #{measure.inspect}"
              elsif (value == '555')
                $stderr.puts "WARNING: Magic value '555' found for #{measure.inspect}"
              end
              if (/^\s*n\/?a\s*$/i.match(value || '')) then
                value = '888'
              elsif (/^\s*x\s*$/i.match(value || '')) then
                value = '888'
              elsif (/^\s*\?\s*$/i.match(value || '')) then
                value = '888'
              elsif (/^\s*nrmp\s*$/i.match(value || '')) then
                value = '888'
              elsif (/^\s*missing\s*$/i.match(value || '')) then
                value = '999'
              elsif (/^\s*national\s+data\s+not\s+available\s*$/i.match(value || '')) then
                value = '555'
              elsif (/^\s*$/i.match(value || '')) then
                value = '555'
              end
              arg_str = [
                site, track, pool, measure, headers[i], r[3], value
              ].map { |x| (x ? "'#{x}'" : 'null') }.join(', ')
              $stdout.puts "select transform.add_match_measure(#{arg_str});"
            }
          end
          row += 1
        }

        $stdout.puts 'commit;'

      end
    end
  end
end

P4::Match::Parser.new(ARGV[0], ARGV[1], ARGV[2])

