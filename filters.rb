# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

  def find(id)
    # Your code Here
    candidates.select.with_index {|candidate| candidate[:id] == id}.map(&:first)
  end
  
  def experienced?(candidate)
    # Your code Here
    if candidate[:years_of_experience] >= 2
      true
    else
      false
  end

  def github_over_100pts?(candidate)
    if candidate[:github_points] >= 100
      true
    else
      false
  end

  def know_ruby_or_python?(candidate)
    if candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
      true
    else
      false
  end

  def apply_within_15_days?(candidate)
    if Date.today - candidate[:date_applied] <= 15
      true
    else
      false
  end

  def adult?(candidate)
    if candidate[:age] >= 18
      true
    else
      false
  end

  def qualified_candidates(candidates)
    # Your code Here
    qualified_candidates_list = []
    candidates.each do |candidate| 
      if experienced?(candidate) 
          && github_over_100pts?(candidate) 
          && know_ruby_or_python?(candidate)
          && apply_within_15_days?(candidate)
          && adult?(candidate)       
        qualified_candidates_list.push(candidate)
      end
    end
    qualified_candidates_list
  end
  
  # More methods will go below

  def ordered_by_qualifications(candidates)
    candidates.sort { |a, b| 
    [a[:years_of_experience], a[:github_points]] 
      <=> [b[:years_of_experience], b[:github_points]] }
  end
