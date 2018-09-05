# json.partial! "cases/case", case: @case

json.extract! @case, :id, :title, :content
json.url case_url(@case)