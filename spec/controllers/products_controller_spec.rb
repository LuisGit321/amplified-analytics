require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProductsController do

  def mock_product(stubs={:attributes => {}})
    @mock_product ||= mock_model(Product, stubs)
  end
  
  before do
    sign_in users(:quentin)
  end
  
  describe "GET index" do
    it "assigns all products as @products" do
      Product.should_receive(:paginate).with(:per_page=>20, :page=>nil, :order=>"name ASC").and_return([mock_product])
      get :index
      assigns[:products].should == [mock_product]
    end
  end

  describe "GET show" do
    it "assigns the requested product as @product" do
      Product.stub!(:find).with("37").and_return(mock_product)
      get :show, :id => "37"
      assigns[:product].should equal(mock_product)
    end
  end

  # describe "GET new" do
  #   it "assigns a new product as @product" do
  #     Product.stub!(:new).and_return(mock_product)
  #     get :new
  #     assigns[:product].should equal(mock_product)
  #   end
  # end
  # 
  # describe "GET edit" do
  #   it "assigns the requested product as @product" do
  #     Product.stub!(:find).with("37").and_return(mock_product)
  #     get :edit, :id => "37"
  #     assigns[:product].should equal(mock_product)
  #   end
  # end
  # 
  # describe "POST create" do
  # 
  #   describe "with valid params" do
  #     it "assigns a newly created product as @product" do
  #       Product.stub!(:new).with({'these' => 'params'}).and_return(mock_product(:save => true))
  #       post :create, :product => {:these => 'params'}
  #       assigns[:product].should equal(mock_product)
  #     end
  # 
  #     it "redirects to the created product" do
  #       Product.stub!(:new).and_return(mock_product(:save => true))
  #       post :create, :product => {}
  #       response.should redirect_to(product_url(mock_product))
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved product as @product" do
  #       Product.stub!(:new).with({'these' => 'params'}).and_return(mock_product(:save => false))
  #       post :create, :product => {:these => 'params'}
  #       assigns[:product].should equal(mock_product)
  #     end
  # 
  #     it "re-renders the 'new' template" do
  #       Product.stub!(:new).and_return(mock_product(:save => false))
  #       post :create, :product => {}
  #       response.should render_template('new')
  #     end
  #   end
  # 
  # end
  # 
  # describe "PUT update" do
  # 
  #   describe "with valid params" do
  #     it "updates the requested product" do
  #       Product.should_receive(:find).with("37").and_return(mock_product)
  #       mock_product.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :product => {:these => 'params'}
  #     end
  # 
  #     it "assigns the requested product as @product" do
  #       Product.stub!(:find).and_return(mock_product(:update_attributes => true))
  #       put :update, :id => "1"
  #       assigns[:product].should equal(mock_product)
  #     end
  # 
  #     it "redirects to the product" do
  #       Product.stub!(:find).and_return(mock_product(:update_attributes => true))
  #       put :update, :id => "1"
  #       response.should redirect_to(product_url(mock_product))
  #     end
  #   end
  # 
  #   describe "with invalid params" do
  #     it "updates the requested product" do
  #       Product.should_receive(:find).with("37").and_return(mock_product)
  #       mock_product.should_receive(:update_attributes).with({'these' => 'params'})
  #       put :update, :id => "37", :product => {:these => 'params'}
  #     end
  # 
  #     it "assigns the product as @product" do
  #       Product.stub!(:find).and_return(mock_product(:update_attributes => false))
  #       put :update, :id => "1"
  #       assigns[:product].should equal(mock_product)
  #     end
  # 
  #     it "re-renders the 'edit' template" do
  #       Product.stub!(:find).and_return(mock_product(:update_attributes => false))
  #       put :update, :id => "1"
  #       response.should render_template('edit')
  #     end
  #   end
  # 
  # end
  # 
  # describe "DELETE destroy" do
  #   it "destroys the requested product" do
  #     Product.should_receive(:find).with("37").and_return(mock_product)
  #     mock_product.should_receive(:destroy)
  #     delete :destroy, :id => "37"
  #   end
  # 
  #   it "redirects to the products list" do
  #     Product.stub!(:find).and_return(mock_product(:destroy => true))
  #     delete :destroy, :id => "1"
  #     response.should redirect_to(products_url)
  #   end
  # end    

end
