require 'test_helper'

class RablTest < ActiveSupport::TestCase

  test 'Rabl Deposit Data into Database' do
    
    file =  File.join(Rails.root.to_s, 'db', Rails.env + '.sqlite3')
    
    File.unlink file if File.exist? file

    system('rake db:migrate')
  
    ds = Rabl::Deposit.new(:file => File.join(Rails.root.to_s, 'data', 'potpourri.yml'),
    
                  :special_columns => ['code'],
                  :delete_all => false,
                  :cache_enabled => true,
                  :debug => 9,
                  :search_columns => { :code => true, :mnemonic => true, :label => true, :name => true },
                 )

    ds.scoop
    
  end
  
end
