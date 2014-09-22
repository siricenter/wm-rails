object @apartment

attributes :id, :description, :title

child(:beds, object_root: false) do
	attributes :letter
end
