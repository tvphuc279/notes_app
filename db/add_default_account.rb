begin
  ActiveRecord::Base.transaction do
    puts "==============ADD DEFAULT ACCOUNT================"
    default_email = 'tvphuc279@gmail.com'
    user = User.find_by(email: default_email)
    if user 
      puts "The account with email='tvphuc279@gmail.com' has already exist"
      return
    else
      user = User.new(email: default_email, first_name: 'Phuc', 
                      last_name: 'Truong', phone: '090-818-5536', skype: 'tvphuc279', 
                      address: '4/3/3 Nguyen Huu Tho street, Ben Luc district, Long An province', 
                      password: '12345678')
      user.skip_confirmation!
      user.confirm
      unless user.save
        puts "\t Error: #{user.errors.full_messages}"
        raise ActiveRecord::Rollback  
      end 
    end  
    puts "=============COMPLETED============================"
  end
rescue => e
  puts "------------ERROR--------------------------------"
  puts e
  raise ActiveRecord::Rollback
end
