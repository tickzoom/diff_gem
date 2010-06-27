require 'runit/testcase'
require 'runit/cui/testrunner'
require 'runit/testsuite'
require 'diff'
require 'emaildiff'
require 'test_emailcases'

class EmailDiffTest < RUNIT::TestCase

  include EmailDiffArrayTests
  def emailtest(a, b, c)
    #puts "old string:"
    #puts a
    #puts "new string:"
    #puts b
    diff = EmailDiff.new(a, b)
    d = a.patch_email(diff,888,999)
    #puts "result:"
    #puts d
    assert_equal(c,d)
  end
end

RUNIT::CUI::TestRunner.run(EmailDiffTest.suite)
