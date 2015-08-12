require 'active_support'
module MyModule
  def alias_method_chain(target, feature)
    # Strip out punctuation on predicates or bang methods since
    # e.g. target?_without_feature is not a valid method name.
    aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1
    yield(aliased_target, punctuation) if block_given?

    with_method = "#{aliased_target}_with_#{feature}#{punctuation}"
    without_method = "#{aliased_target}_without_#{feature}#{punctuation}"

    alias_method without_method, target
    alias_method target, with_method

    case
      when public_method_defined?(without_method)
        public target
      when protected_method_defined?(without_method)
        protected target
      when private_method_defined?(without_method)
        private target
    end
  end
end

class MySuperClass
  def test_he
      "old"
  end
end

class MyClass < MySuperClass
  extend MyModule

  def test_he_with_other
      "new"
  end

  alias_method_chain :test_he ,:other
end

myclass = MyClass.new
p MyClass.instance_methods(false).map{|m| "#{m} : #{myclass.send(m)}"}
