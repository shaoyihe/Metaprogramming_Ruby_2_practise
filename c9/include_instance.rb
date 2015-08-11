module  MyModule
  def get_some
    @test
  end
end

class MyClass
  extend MyModule

  @test = "some"
end

p MyModule.instance_variables
p MyClass.class_variables
p MyClass.instance_variables
p MyClass.get_some