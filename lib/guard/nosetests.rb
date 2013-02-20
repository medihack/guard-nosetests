require "guard"
require "guard/guard"

module Guard
  class Nosetests < Guard
    autoload :Runner, 'guard/nosetests/runner'

    def initialize(watchers = [], options = {})
      super

      @options = {
        :all_on_start   => true,
        :test_paths     => ["test"],
        :run_all        => {}
      }.merge(options)
      @last_failed  = false
      @failed_paths = []

      @runner = Runner.new(@options)
    end

    def start
      UI.info "Guard::Nosetests is running"
      run_all if @options[:all_on_start]
    end

    def run_all
      test_paths = options[:test_paths] || []
      passed = @runner.run(test_paths, @options[:run_all].merge(:message => 'Running all nose tests'))
      report(passed)
    end

    def run_on_changes(paths)
      passed = @runner.run(paths)
      report(passed)
    end

  private

    def report(passed)
      if passed
        ::Guard::Notifier.notify("Passed", :title => "Python Nose Tests", :image => :success)
      else
        ::Guard::Notifier.notify("Failed", :title => "Python Nose Tests", :image => :failed)
        throw :task_has_failed
      end
    end
  end
end
