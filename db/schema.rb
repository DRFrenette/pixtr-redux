ActiveRecord::Schema.define(version: 20141019024044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "galleries", force: true do |t|
    t.string "name"
    t.string "description"
  end

end
