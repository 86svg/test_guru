class User < ApplicationRecord
  def tests_by_level(level)
   Test.joins('JOIN test_passing ON test_passing.test_id = tests.id')
      .where(test_passing: { user_id: id }, tests: { level: level })
  end
end
