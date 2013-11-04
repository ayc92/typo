Then /^(?:|I )should see the (.*) of article ([1-9][0-9]*)$/ do |text|
	attribute = Article.find($2).send($1.to_sym)
	if attribute.instance_of?(Array)
		attribute.each do |a|
			step "I should see \"#{a}\""
		end
	else
		step "I should see \"#{attribute}\""
	end
end