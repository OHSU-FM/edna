#!/usr/bin/env ruby

require 'csv'
require 'debugger'

module P4
  module WebADS
    class Normalizer

      M_STRUCT = 777
      M_NA = 888
      M_MISSING = 999

      def initialize(year = 1, suppress_header = false)
        row = 0
        headers = {}

        map = {
          :freqproc => 1,
          :freqdx => 2,
          :adultdx => 3,
          :peddx => 4
        }

        output_headers_array = [
          'p4_program_id', 'type', 'ranking', 'name', 'year'
        ]

        CSV { |out|
          unless (suppress_header)
            out << output_headers_array
          end
          CSV($stdin) { |r|
            debugger
            if (row == 0)
              r.each_with_index { |name, index|
                headers[name] = index   # Hash headers: name => index
              }
            else
              id = r[headers['p4_program_id']]
              map.each_pair { |type_name, type_id|
                (1..10).each { |i|
                  column = (
                    headers["#{type_name}#{i}s"] \
                      || headers["#{type_name}#{i}"]
                  )
                  out << [ id, type_id, i, r[column], year ]
                }
              }
            end
            row += 1
          }
        }
      end
    end
  end
end

P4::WebADS::Normalizer.new(ARGV[0], (ARGV[1] || '').length > 0)

