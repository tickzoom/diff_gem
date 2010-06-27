require 'runit/testcase'
require 'runit/cui/testrunner'
require 'runit/testsuite'
require 'diff'
require 'emaildiff'
require 'test_emailcases'

class EmailDiffTest < RUNIT::TestCase

  include DiffArrayTests

  def difftest(a, b, c)
    #puts "old string:"
    #puts a
    #puts "new string:"
    #puts b
    diff = Diff.new(a, b)
    d = a.collapse(diff,888,999)
    #puts "result:"
    #puts c
    assert_equal(c,d)
  end
end


RUNIT::CUI::TestRunner.run(EmailDiffTest.suite)
