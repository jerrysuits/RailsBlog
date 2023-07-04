import React, { useContext } from 'react'
import { PostContext } from '../context/PostContext'
import { Link } from 'react-router-dom'

export default function Home() 
{
  const {posts} =useContext(PostContext)

  return (
    <div>

        <div class="grid grid-cols-2 md:grid-cols-3 gap-4">
        {
        posts && posts.map && posts.map((post)=>(
            <Link to={`/post/${post.id}`} key={post.id} className={post.archive?"bg-red-700 text-white":'bg-gray-300'}>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/square/image.jpg" alt="" />
                <div className='p-3'>
                   <h4 className='font-bold text-2xl'>{post.title}</h4>
                   <p>Posted by {post.user.username}</p>
                   {/* <Link to={`/post/${post.id}`} type="button" class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">Read More</Link> */}
                    {/* <button className='bg-green-600 text-white'>Approve</button> */}
                </div>
            </Link>
        ))
      }
        </div>

    </div>
  )
}
