Given /the following admins exist/ do |admins_table|
  admins_table.hashes.each do |admin|
    Admin.create admin
  end
  #flunk "Unimplemented"
end

Given /the following partners exist/ do |partners_table|
  partners_table.hashes.each do |partner|
    Partner.create partner
  end
  #flunk "Unimplemented"
end

Given /the following forms exist/ do |forms_table|
  forms_table.hashes.each do |form|
    Form.create form
  end
  #flunk "Unimplemented"
end

When /I go to the "(.*)" page/ do |link|
	visit(link)
end

And /I fill in "(.*)" with "(.*)"/ do |field, element|
	fill_in field, :with => element
end

And /I click the "(.*)" button/ do |butn|
	click_button butn
end

Then /I should see myself as an "(.*)"/ do |role|
	#assert page.body =~ /#{role}/
	page.should have_content role
end

Then /I should see "(.*)"/ do |msg|
	assert page.body =~ /#{msg}/
end

Then /I would be at "(.*)" page/ do |pg|
	assert page.body =~ /#{pg}/
end

When /I click the "(.*)" link/ do |lk|
	click_link lk
end

And /I select option "(.*)" from "(.*)"/ do |option, form_id|
	select option, :from => form_id
end

And /I choose "(.*)" from radio option/ do |choice|
	choose choice
end

And /I check the checkbox "(.*)"/ do |checkbox|
	check checkbox
end

And /there will be "(.*)" forms in "(.*)" table/ do |num1, form1|
  temp1 = 'table#' + form1 + ' tr'
  rows_in_table = page.all(temp1).size - 1
  assert(num1.to_i == rows_in_table, rows_in_table.to_s + " does not equal " + num1.to_s)
end