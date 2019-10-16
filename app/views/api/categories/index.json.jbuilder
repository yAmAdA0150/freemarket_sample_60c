json.array! @children do |child|
  json.id child.id
  json.name child.genre
  json.ancestry child.ancestry
end

json.array! @gchildren do |gchild|
  json.id gchild.id
  json.name gchild.genre
end

json.array! @sizes do |size|
  json.id size.id
  json.name size.name
end