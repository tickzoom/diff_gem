require 'diff'

class EmailDiff < Diff
  GREATER = 62

  attr_reader :orig_a, :orig_b

  def initialize(diffs_or_a, b = nil, isstring = nil)
    if b.nil?
      @diffs = diffs_or_a
      @isstring = isstring
      super
    else
      @diffs = []
      @curdiffs = []
      strip_a = striplines(diffs_or_a)
      strip_b = striplines(b)
      makediff(strip_a, strip_b)
      @orig_a = diffs_or_a
      @orig_b = b
      @difftype = diffs_or_a.class
    end
  end

  def striplines(ary) 
    newary= ary.dup
    newary.each_with_index { |item,index| 
      if item.class == String
        item = item.dup
        item.strip
        while item[0] == GREATER
          item.slice!(0)
          item.strip
          newary[index] = item
        end
      end
    } 
    return newary
  end
end  

module HTMLCollapsable
  def diff(b)
    Diff.new(self, b)
  end

  def patch_email(diff,starttoken,endtoken)
    newary = nil
    if diff.difftype == String
      newary = diff.difftype.new('')
    else
      newary = diff.difftype.new
    end
    ai = 0
    bi = 0
    diff.diffs.each { |d|
      d.each { |mod|
        quoted = 0
	case mod[0]
	when '-'
	  if ai < mod[1] 
            quoted = 1
          end
          newary << starttoken if quoted == 1
	  while ai < mod[1]
	    newary << diff.orig_b[bi]
	    ai += 1
	    bi += 1
	  end
	  newary << endtoken if quoted == 1
	  ai += 1
	when '+'
	  if bi < mod[1] 
            quoted = 1
          end
          newary << starttoken if quoted == 1
	  while bi < mod[1]
	    newary << diff.orig_b[bi]
	    ai += 1
	    bi += 1
	  end
	  newary << endtoken if quoted == 1
	  newary << diff.orig_b[mod[1]]
	  bi += 1
	else
	  raise "Unknown diff action"
	end
      }
    }
    quoted = 0
    if ai < self.length
      quoted = 1
    end
    newary << starttoken if quoted == 1
    while ai < self.length
      newary << diff.orig_b[bi]
      ai += 1
      bi += 1
    end
    newary << endtoken if quoted == 1
    return newary
  end
end

class Array
  include HTMLCollapsable
end

class String
  include HTMLCollapsable
end

