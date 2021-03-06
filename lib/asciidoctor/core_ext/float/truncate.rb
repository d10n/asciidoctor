if (Float.instance_method :truncate).arity == 0
  Float.prepend(Module.new do
    def truncate *args
      if args.length == 1
        if (precision = Integer args.shift) == 0
          super
        elsif precision > 0
          precision_factor = 10.0 ** precision
          (self * precision_factor).to_i / precision_factor
        else
          precision_factor = 10 ** precision.abs
          (self / precision_factor).to_i * precision_factor
        end
      else
        super
      end
    end
  end)
end
