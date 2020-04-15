macro define_struct(classname, fields...)
    quote
        mutable struct $classname
            $(fields...)
            function $classname($(fields...))
                new($(fields...))
            end
        end
    end
end
#@macroexpand @define_struct foo bar baz
#x = foo(1,2)
#x.bar
#x.baz
