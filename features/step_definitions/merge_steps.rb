Then /^(?:|I )should see the (.*) of article ([1-9][0-9]*)$/ do |type, id|
	attribute = Article.find(id).send(type.to_sym)
	puts attribute
	if attribute.instance_of?(Array)
		attribute.each do |a|
			step "I should see \"#{a}\""
		end
	else
		step "I should see \"#{attribute}\""
	end
end