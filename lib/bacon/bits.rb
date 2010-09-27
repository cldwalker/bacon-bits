# -*- encoding: utf-8 -*-

require 'bacon'

module Bacon
  module Bits
    VERSION = '0.1.0'

    # Will remove this once the latest bacon (which contains this) is released as a gem
    def self.included(mod)
      mod.module_eval do
        # nested context methods automatically inherit methods from parent contexts
        def describe(*args, &block)
          context = Bacon::Context.new(args.join(' '), &block)
          (parent_context = self).methods(false).each {|e|
            class<<context; self end.send(:define_method, e) {|*args| parent_context.send(e, *args)}
          }
          @before.each { |b| context.before(&b) }
          @after.each { |b| context.after(&b) }
          context.run
        end
      end
    end

    def xit(*args); end
    def xdescribe(*args); end
    def before_all; yield; end
    def after_all; yield; end
    def assert(description, &block)
      it(description) do
        block.call.should == true
      end
    end
  end

  # Inspired by http://gist.github.com/80533
  module StylishTestUnitOutput
    include TestUnitOutput

    def handle_requirement(description)
      error = yield
      print error.empty? ? "\e[32m✓ \e[m" : "\e[31m✗ \e[m"
    end
  end
end

Bacon::Context.send :include, Bacon::Bits
