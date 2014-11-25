object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:products_count) { @products.size }
  child @products do
    attributes :id, :title, :created_at, :image_url
  end
end