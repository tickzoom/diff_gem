require 'runit/testcase'
require 'runit/cui/testrunner'
require 'runit/testsuite'
require 'diff'
require 'emaildiff'
require 'test_emailcases'

class EmailDiffTest < RUNIT::TestCase

  include EmailDiffArrayTests
  def emailtest(a, b, c, d = :tokens)
    #puts "old string:"
    #puts a
    #puts "new string:"
    #puts b
    diff = EmailDiff.new(a, b)
    #puts "old stripped:"
    #puts diff.strip_a
    #puts "new stripped:"
    #puts diff.strip_b
    if d == :tokens 
      result = a.patch_email(diff,888,999)
    else
      result = a.patch_email(diff)
    end
    #puts "result:"
    #puts d
    assert_equal(c,result)
  end
end

RUNIT::CUI::TestRunner.run(EmailDiffTest.suite)
