collection @apartments, root: "apartments", object_root: false

attributes :id, :title

child(:beds, object_root: false) do
	attributes :id, :letter
end
