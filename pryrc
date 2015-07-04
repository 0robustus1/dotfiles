class Object

  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  def find_me(symbol=:uni)
    email = case symbol
            when :uni then 'tredd@informatik.uni-bremen.de'
            when :private then 'treddehase@dsone.eu'
            else 'robustus@rightsrestricted.com'
            end
    User.find_by_email email
  end

  def sql
    connection = ActiveRecord::Base.connection
    if block_given?
      yield connection
    else
      connection
    end
  end

end
