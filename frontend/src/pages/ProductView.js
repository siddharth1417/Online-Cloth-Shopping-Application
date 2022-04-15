import { useLocation } from "react-router";
import Card from "../component/product/Card";
import Navbar from "../component/navbar/Navbar";
import React from "react";
import { useParams } from "react-router-dom";
import { useState, useEffect } from "react";
import axios from "axios";
import FeedbackCard from "../component/product/FeedbackCard";
import { URLUSER } from "../utils/config";
import { toast } from "react-toastify";
import "./productViewAvgrating.css";

const ProductView = () => {
  // const url = `http://localhost:8080/api/public/product/user/productDetails/${}`;
  const [feedbacks, setFeedbacks] = useState([]);
  const { state } = useLocation()
  const [comment, setComment] = useState('')
  const [rating, setRating] = useState('')
  const [avgRatings, setAvgRating] = useState('')
  const currentUserId = sessionStorage.id

  const [product, setProduct] = useState("");
  let content = null;
  const { id } = useParams();
  const getSingleProduct = async () => {
    const { data } = await axios.get(
      `http://localhost:8080/api/public/product/user/productDetails/${id}`
    );
    console.log(data);
    setProduct(data);
  };

  useEffect(() => {
    // axios.get(url).then((response) => {
    //   setProduct(response.data);

    getSingleProduct();
  }, []);

  const sendComment = () => {
    if (comment.length == 0) {
      toast.warning('please enter comment')
    } else {

      const body = {
        userId: currentUserId,
        rating,
        comment,
      }

      const url = `${URLUSER}/user/product/addFeedback/${id}`
      axios.post(url, body,{
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${sessionStorage.tokenId}`
            }
        }).then((response) => {
        console.log(response.data.data)
        const result = response.data

        // clear the comment box
        setComment('')

        if (result['status'] == 'success') {
          toast.success('successfully added a comment')

          // refreshing the blog details
        } else {
          toast.error(result['error'])
        }
      })
    }
    window.location.reload()
  }
  useEffect(()=>{
    getAllFeedback();

  },[])
  useEffect(()=>{
    getAvgRating();

  },[])


  const getAllFeedback = () => {
      const Url = `${URLUSER}/api/public/product/allFeedback/${id}`;
      axios.get(Url,{
          headers: {
              'Content-Type': 'application/json',
              'Authorization': `Bearer ${sessionStorage.tokenId}`
          }
      }).then((response) => {

          setFeedbacks(response.data.data)
          console.log(response.data)
          //second request
      }).catch((err) => {
          console.log(err.response)
          //add jumbotron component of bootstrap showing error msg = err.response.message
      })
  }

  const getAvgRating = () => {
    const Url = `${URLUSER}/api/public/product/avgRating/${id}`;
    axios.get(Url,{
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${sessionStorage.tokenId}`
        }
    }).then((response) => {

        setAvgRating(response.data.data)
        console.log(response.data)
        //second request
    }).catch((err) => {
        console.log(err.response)
        //add jumbotron component of bootstrap showing error msg = err.response.message
    })
}

  // const { id, productName, productPrice, productDescription, size, imageUrl } =
  if (product) {
    content = (
      <div class="container mt-5 mb-5">
        {/* <h1>{product.data.productName}</h1> */}
        <div class="row d-flex justify-content-center">
          <div class="col-md-10">
            <div class="card">
              <div class="row">
                <div class="col-md-6">
                  <div class="images p-3">
                    <div class="inner2">
                      {" "}
                      <img id="main-image" src={product.data.imageUrl} />{" "}
                    </div>
                    <div class="thumbnail text-center"> </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="product p-4">
                    <div class="d-flex justify-content-between align-items-center">
                      <div class="d-flex align-items-center">
                        {" "}
                        <i class="fa fa-long-arrow-left"></i>{" "}
                        <span class="ml-1">
                          {" "}
                          <a href="/products">Back</a>{" "}
                        </span>{" "}
                      </div>{" "}
                      <i class="fa fa-shopping-cart text-muted"></i>
                    </div>
                    <div class="mt-4 mb-3">
                      {" "}
                      <span class="text-uppercase text-muted brand">
                        Orianz
                      </span>
                      <h5 class="text-uppercase">{product.data.productName}</h5>
                      <div class="price d-flex flex-row align-items-center">
                        {" "}
                        <p className="card-text" class="text-success">
                          ₹{product.data.productPrice}{" "}
                          <strike class="text-danger">
                            {" "}
                            ₹{Math.ceil((product.data.productPrice * 11) / 10)}
                          </strike>{" "}
                          (10% OFF){" "}
                        </p>
                      </div>
                    </div>
                    <p class="about">
                      Shop from a wide range of varieties. Pefect for your
                      everyday use, you could pair it with a stylish pair of
                      jeans or trousers complete the look.
                    </p>
                    <div class="sizes mt-5">
                      <h6 class="text-uppercase">Size</h6>{" "}
                      <label class="radio">
                        {" "}
                        <input
                          type="radio"
                          name="size"
                          value="s"
                          checked
                        />{" "}
                        <span>S</span>{" "}
                      </label>
                      <label class="radio">
                        {" "}
                        <input
                          checked
                          type="radio"
                          name="size"
                          value="s"
                        />{" "}
                        <span>M</span>{" "}
                      </label>
                      <label class="radio">
                        {" "}
                        <input
                          checked
                          type="radio"
                          name="size"
                          value="s"
                        />{" "}
                        <span>L</span>{" "}
                      </label>
                      <label class="radio">
                        {" "}
                        <input
                          checked
                          type="radio"
                          name="size"
                          value="ex"
                        />{" "}
                        <span>XL</span>{" "}
                      </label>
                      <label class="radio">
                        {" "}
                        <input
                          checked
                          type="radio"
                          name="size"
                          value="ex"
                        />{" "}
                        <span>XXL</span>{" "}
                      </label>
                    </div>
                    <div class="cart mt-4 align-items-center">
                      {" "}
                      <button class="btn btn-danger text-uppercase mr-2 px-4">
                        Add to cart
                      </button>{" "}
                      <i class="fa fa-heart text-muted"></i>{" "}
                      <i class="fa fa-share-alt text-muted"></i>{" "}
                    </div>
                    <div class="bg-light">{product.data.productDetails}</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      
      //******************************************* */
      // <div className="container">
      //   <h1>{id}</h1>
      //   <div className="col">
      //     <div className="p-2 bg-light">
      //       <div className="card imageDimension">
      //         {/* http://localhost:8080/product/user/productDetails/${props.productI.id} */}
      //         <div className="inner">
      //           <img
      //             src={product.imageUrl}
      //             // ../../images/1.jpg
      //             class="w-100"
      //             alt="card_image"
      //           />
      //         </div>

      //         <div className="card-body">
      //           <h5 className="card-title">{product.productName}</h5>
      //           <p className="card-text" class="text-success">
      //             ₹{product.productPrice}{" "}
      //             <strike class="text-danger"> ₹{(100 * 11) / 10}</strike> (10%
      //             OFF){" "}
      //           </p>
      //           <button>Add to Cart</button>
      //           <div>{product.productDescription}</div>
      //         </div>
      //       </div>
      //     </div>
      //   </div>
      // </div>
    );
  }

  return (
    <div>
      <div>
        <h1>product view </h1>
        {content}
      </div>
      <div className="row">
        <h3>Feedback</h3>
        <h2>Please First Login to view/add feedback and rating of product</h2>  
        <div className="col"></div>
      </div>
      {/* <div class="d-flex flex-row add-comment-section mt-4 mb-4">
        <input type="text" class="form-control mr-3" placeholder="Add comment"/>
        <button class="btn btn-primary" type="button">
          Comment
        </button>
      </div> */}




      {/* I will be adding Add comment and Add rating logic below here */}
      {product && currentUserId != product.userId && (
        <div>
          <div className="row">
            <div>
              <div class="rating">
              <input 
                type="radio" 
                name="rating" 
                onChange={(e) => {
                  setRating(e.target.value)
                  }}                
                value="5" 
                id="5"
              /><label for="5">☆</label>
   
              <input 
                type="radio" 
                name="rating" 
                onChange={(e) => {
                  setRating(e.target.value)
                  }} 
                value="4" 
                id="4"/><label for="4">☆</label> 
              <input 
                type="radio" 
                name="rating"
                onChange={(e) => {
                  setRating(e.target.value)
                  }} 
                value="3" 
                id="3"/><label for="3">☆</label> 
              <input 
                type="radio" 
                name="rating" 
                onChange={(e) => {
                  setRating(e.target.value)
                  }}
                value="2" 
                id="2"/><label for="2">☆</label> 
              <input 
                type="radio" 
                name="rating"
                onChange={(e) => {
                  setRating(e.target.value)
                  }} 
                value="1" 
                id="1"/><label for="1">☆</label> 
              </div>
            </div>
            <div>
              <textarea
                onChange={(e) => {
                  setComment(e.target.value)
                  }}
                class="form-control" 
                placeholder="what is your view?" 
                rows="4">
              </textarea>
            </div>
            <div>
              <button
                onClick={sendComment}
                style={{ marginTop: '10px' }}
                className="btn btn-success"
              >
                Send
              </button>
            </div>
          </div>
          {/* Added For Showing Average Rating Of Product By AvgRating API from BACKEND */}
          <div class="container-fluid px-1 py-5 mx-auto">
            <div class="row justify-content-center">
              <div class="col-xl-8 col-lg-9 col-md-10 col-12 text-center mb-5">
                <div class="card">
                  <div class="cirle-img"> <img src="https://i.imgur.com/IRsUTtE.jpg"/>
                      <div class="rating-on-img">
                          <h3 class="head-rate">{avgRatings}</h3>
                          <h3 class="subhead-rate">out of 5</h3>
                      </div>
                  </div>
                  <div class="heading0 mb-3 text-center">
                      <h2>Average Rating</h2>
                      <h2>Reviews, by real people</h2>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div> 

      )}       

        {/* <div class="d-flex flex-row add-comment-section mt-4 mb-4"><input type="text" class="form-control mr-3" placeholder="Add comment"/><button class="btn btn-primary" type="button" onClick={sendCommment()}>Comment</button></div> */}
        <div className="row">
        {feedbacks.map((feedback) => {
          return <FeedbackCard fed={feedback} />;
        })}
        
        {
            console.log(feedbacks)
        }
        {/* <AddressCard/>
        <AddressCard/> */}
        </div>
                
    </div>
  );
};

export default ProductView;
