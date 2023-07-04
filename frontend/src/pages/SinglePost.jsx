import React, { useContext, useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { PostContext } from '../context/PostContext'
import Swal from 'sweetalert2'
import { AuthContext } from '../context/AuthContext'
export default function SinglePost() 
{
  const {deletePost} = useContext(PostContext)
  const {current_user} = useContext(AuthContext)

  const {id} = useParams()
  const [post, setPost] = useState()

  useEffect(()=>{
  fetch(`/api/posts/${id}`)
  .then((res)=>res.json())
  .then((response)=>{
    setPost(response)
  })
 },[])

 const handleDelete = ()=>{
   
Swal.fire({
  title: 'Are you sure?',
  text: "You won't be able to revert this!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes, delete it!'
}).then((result) => {
  if (result.isConfirmed) {
    deletePost(id)
    Swal.fire(
      'Deleted!',
      'Your file has been deleted.',
      'success'
    )
  }
})
  
 }


  return (
    <div>
      

<main class="pt-8 pb-16 lg:pt-16 lg:pb-24 bg-white dark:bg-gray-900">
  <div class="flex justify-between px-4 mx-auto max-w-screen-xl ">
      <article class="mx-auto w-full max-w-2xl format format-sm sm:format-base lg:format-lg format-blue dark:format-invert">
          <header class="mb-4 lg:mb-6 not-format">
              <address class="flex items-center mb-6 not-italic">
                  <div class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white">
                      {/* <img class="mr-4 w-16 h-16 rounded-full" src="https://flowbite.com/docs/images/people/profile-picture-2.jpg" alt="Jese Leos" /> */}
                      <img class="bg-gray-500 mr-4 w-16 h-16 rounded-full" src={post && post.user.profile_image} alt="dp" />

                      <div>
                          <a href="#" rel="author" class="text-xl font-bold text-gray-900 dark:text-white">
                            {post && post.user && post.user.username}</a>
                          <p class="text-base font-light text-gray-500 dark:text-gray-400">
                            {post && post.created_at}
                            </p>
                      </div>
                  </div>
              </address>
              <h1 class="mb-4 text-3xl font-extrabold leading-tight text-gray-900 lg:mb-6 lg:text-4xl dark:text-white">
               {post && post.title}</h1>
          </header>
         
          <figure><img src="https://flowbite.s3.amazonaws.com/typography-plugin/typography-image-1.png" alt="" />
          </figure>
          <div className='flex justify-end mt-10'>
           {(post && post.user && post.user.username) == (current_user && current_user.username) &&
            <p  onClick={handleDelete} className='text-red-600 hover:cursor-pointer hover:text-red-900'>
              Delete</p>
           }          
           </div>

          <p className='mt-8'>{post && post.content}</p>
   
       
   
      </article>
  </div>
</main>



    </div>
  )
}
