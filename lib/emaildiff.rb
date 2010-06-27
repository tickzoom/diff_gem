require 'diff'

module HTMLCollapsable
  def diff(b)
    Diff.new(self, b)
  end

  def collapse(diff,starttoken,endtoken)
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
	    newary << self[ai]
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
	    newary << self[ai]
	    ai += 1
	    bi += 1
	  end
	  newary << endtoken if quoted == 1
	  newary << mod[2]
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
      newary << self[ai]
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

