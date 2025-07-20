# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

  def find(id, candidates)
    # Your code Here
    candidates.find {|candidate| candidate[:id] == id}
  end
  
  def experienced?(candidate)
    # Your code Here
    candidate[:years_of_experience] >= 2
  end

  def github_over_100pts?(candidate)
    candidate[:github_points] >= 100
  end

  def know_ruby_or_python?(candidate)
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end

  def apply_within_15_days?(candidate)
    Date.today - candidate[:date_applied] <= 15
  end

  def adult?(candidate)
    candidate[:age] >= 18
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
    [-a[:years_of_experience], -a[:github_points]] 
      <=> [-b[:years_of_experience], -b[:github_points]] }
  end
