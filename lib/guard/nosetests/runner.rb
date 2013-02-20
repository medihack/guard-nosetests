module Guard
  class Nosetests
    class Runner

      attr_accessor :options

      def initialize(options = {})
        @options = {
          :cli => nil,
          :env => nil
        }.merge(options)
      end

      def run(paths, options = {})
        return false if paths.empty?

        message = options[:message] || "Running: #{paths.join(' ')}"
        UI.info(message, :reset => true)

        options = @options.merge(options)

        run_via_shell(paths, options)
      end

    private

      def environment_variables
        return if @options[:env].nil?
        "export " + @options[:env].map {|key, value| "#{key}=#{value}"}.join(' ') + ';'
      end

      def nosetests_command(paths, options)
        cmd_parts = []
        cmd_parts << environment_variables
        cmd_parts << "nosetests"
        cmd_parts << options[:cli]
        cmd_parts << paths.join(" ")
        cmd_parts.compact.join(' ')
      end

      def run_via_shell(paths, options)
        system(nosetests_command(paths, options))
      end
    end
  end
end
