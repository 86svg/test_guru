class User < ApplicationRecord
  def tests_by_level(level)
   Test.joins('JOIN test_passings ON test_passings.test_id = tests.id')
      .where(level: level, test_passings: { user_id: id } )
  end
end
