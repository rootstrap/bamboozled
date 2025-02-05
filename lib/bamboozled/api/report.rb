module Bamboozled
  module API
    class Report < Base

      def find(number, format = "JSON", fd_param = true)
        request(:get, "reports/#{number}?format=#{format.upcase}&fd=#{fd_param.yesno}")
      end

      def custom(fields, include_null = true, last_changed_date = nil,  format = "JSON")
        options = {
          body: body(fields, include_null, last_changed_date),
          headers: { "Content-Type" => "application/json" }
        }

        response = request(:post, "reports/custom?format=#{format.upcase}", options)
        response["employees"]
      end

      private

      def body(fields, include_null, last_changed_date)
        body = {}
        body[:fields] = if fields == :all
                          FieldCollection.all_names
                        else
                          fields
                        end
        body[:filters] = { lastChanged: last_changed_filter(include_null, last_changed_date) }

        body.to_json
      end

      def last_changed_filter(include_null, last_changed_date)
        last_changed_filter = {}
        last_changed_filter[:includeNull] = include_null.yesno
        last_changed_filter[:value] = last_changed_date

        last_changed_filter
      end
    end
  end
end
