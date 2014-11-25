node (:success) { true }
node (:info) { 'ok' }

child :data do
  child @product do
    attributes :id, :title, :created_at, :image_url
  end
end
