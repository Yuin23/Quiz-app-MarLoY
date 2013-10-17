
FactoryGirl.define do

	factory :quiz do 
		title "My quiz"
	end 

 	factory :right_answer, class: Answer do
 		sequence(:response) { |n| "Correct#{n}"}
 		# response "Correct"
 		correctness true
 	end 



    factory :wrong_answer, class: Answer do 
		 sequence(:response) { |n| "Incorrect#{n}"} 
         # response "Incorrect"
         correctness false
     end 


    factory :question do 
          query "What is the right answer? "
          answers {[create(:right_answer), create(:wrong_answer)]}
    end 
end 
