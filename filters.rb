# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

  def find(id)
    # Your code Here
    candidates.select.with_index {|candidate| candidate[:id] == id}.map(&:first)
  end

