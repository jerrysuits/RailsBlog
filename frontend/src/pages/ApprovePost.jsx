import React, { useContext } from 'react'
import { AuthContext } from '../context/AuthContext'
import { PostContext } from '../context/PostContext'
import { Link } from 'react-router-dom'

export default function ApprovePost() 
{
  const {current_user} = useContext(AuthContext)
  const {posts, approvePost} =useContext(PostContext)


  return (
    <div>
    {
    current_user && current_user.is_admin?
    <div>
          <h1>Approve Posts</h1>
          <div class="">
        {
        posts && posts.map && posts.map((post)=>(
          !post.is_approved &&
            <div key={post.id} className="bg-gray-300">
               <div className='border flex mb-5'>
                <img class="h-[20vh] max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image.jpg" alt="" />
                <div className='p-3'>
                   <h4 className='font-bold text-2xl'>{post.title}</h4>
                   <p>Posted by {post.user.username}</p>
                    <button onClick={()=>approvePost(post.id)} className='bg-green-600 rounded-lg px-3 py-1 text-white'>Approve</button>
                </div>
              </div>
            </div >
        ))
      }
        </div>
    </div>:
    <p className='text-red-900 text-center'>Only admins can use this page</p>
    }

    </div>
  )
}
