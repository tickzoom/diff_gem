module DiffArrayTests

  def test_array_append
    difftest [1,2,3], [1,2,3,4], [888,1,2,3,999,4]
    difftest [1,2,3], [1,2,3,4,5], [888,1,2,3,999,4,5]
  end

  def test_array_prepend
    difftest [1,2,3], [0,1,2,3], [0,888,1,2,3,999]
    difftest [1,2,3], [-1,0,1,2,3], [-1,0,888,1,2,3,999]
  end

  def test_array_insert
    difftest [1,2,3], [1,2,4,3], [888,1,2,999,4,888,3,999]
    difftest [1,2,3], [1,2,4,5,3], [888,1,2,999,4,5,888,3,999]
  end

  def test_array_remove
    difftest [1,2,3], [1,3], [888,1,999,888,3,999]

  end

  def test_array_cutfront
    difftest [1,2,3], [2,3], [888,2,3,999]
    difftest [1,2,3], [3], [888,3,999]
  end

  def test_array_cutback
    difftest [1,2,3], [1,2], [888,1,2,999]
    difftest [1,2,3], [1], [888,1,999]
  end

  def test_array_empty
    difftest [1,2,3], [], []
  end

  def test_array_fill
    difftest [], [1,2,3], [1,2,3]
  end

  def test_array_change
    difftest [1,2,3], [1,4,3], [888,1,999,4,888,3,999]
    difftest [1,2,3], [1,4,5], [888,1,999,4,5]
    difftest [1,2,3,4], [1,5,4], [888,1,999,5,888,4,999]
  end

  def test_array_noop
    difftest [1,2,3], [1,2,3], [888,1,2,3,999]
  end

  def test_array_grow
    difftest [1,2,3], [4,1,5,2,6,3,7], [4,888,1,999,5,888,2,999,6,888,3,999,7]
  end

  def test_array_shrink
    difftest [1,2,3,4,5,6,7], [2,4,6], [888,2,999,888,4,999,888,6,999]
  end

end

