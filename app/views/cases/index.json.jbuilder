# json.array! @cases do |law|

json.array! Case.all do |law|
  json.id law.id
  json.case_name law.title
  json.case_link case_url(law)
end
