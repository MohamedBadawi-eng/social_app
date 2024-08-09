import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return  SingleChildScrollView(
      child: Column(
        children:
        [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 10,
            shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(5),),
            margin:const EdgeInsets.all(7),
            child: const Stack(
              alignment: Alignment.bottomRight,
              children:
              [
                Image(
                  image: NetworkImage('https://www.westcounty.com/wp-content/uploads/2019/05/posting-to-social-media.jpg',
                  ),
                  height: 170,
                  width: double.infinity,
                  fit:BoxFit.cover ,
                ),
                 Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text('communicate with friends',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context,index)
              {
                return buildPostItem();
              },
              separatorBuilder: (context,index)
              {
                return const  SizedBox(height: 5,);
              },
              itemCount: 10,
          ),

        ],
      ),
    );
  }
}


Widget buildPostItem()
{
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),),
    margin:const EdgeInsets.all(7),
    child:  Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        children:
        [
          Row(
            children:
            [
              const CircleAvatar(
                radius: 22,
                backgroundImage:   NetworkImage('https://thumbs.dreamstime.com/b/young-hipster-blogger-traveler-denim-jacket-navigator-smartphone-connected-to-g-internet-close-up-portrait-handsome-94033303.jpg'),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  const Row(
                    children:
                    [
                      Text('Mohamed Badawi',style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(width: 6,),
                      Icon(Icons.check_circle,color: Colors.blue,size: 15,),
                    ],
                  ),
                  Text('January 21 , 2024 at 11:00 pm',style: TextStyle(color: Colors.grey[700],fontSize: 12),),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: ()
              {

              }, icon:const  Icon(Icons.more_horiz,size: 20,)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(height: 0.5,width: double.infinity,color: Colors.grey[400],),
          ),
          const Text('Your welcome message should generally be succinct, friendly, and informative. It should clearly confirm and clarify what your subscriber signed up for, as well as provide instructions on how they can opt out.',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                children:
                [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: SizedBox(
                      height: 20,
                      child:MaterialButton(
                        onPressed: () {  },
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        child: const Text('#software',style: TextStyle(  color: Colors.blue,
                        ),),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: SizedBox(
                      height: 20,
                      child:MaterialButton(
                        onPressed: () {  },
                        minWidth: 1,
                        padding: EdgeInsets.zero,
                        child: const Text('#flutter',style: TextStyle(  color: Colors.blue,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsIz4qZKTOplGKCIt860B8HP3mTBMZGACNFg&s'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 7,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0),
            child: Row(
              children:
              [
                Expanded(
                  child: InkWell(
                    onTap: ()
                    {

                    },
                    child: Row(
                      children:
                      [
                        const Icon(IconBroken.Heart,size: 16,),
                        const SizedBox(width: 5,),
                        Text('1200',style: TextStyle(color: Colors.grey[600],fontSize: 10,fontWeight: FontWeight.bold),),

                      ],

                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: ()
                    {

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:
                      [
                        const Icon(IconBroken.Chat,size: 16,color: Colors.amber,),
                        const SizedBox(width: 5,),
                        Text('120 comment',style: TextStyle(color: Colors.grey[600],fontSize: 10,fontWeight: FontWeight.bold),),

                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(height: 0.5,width: double.infinity,color: Colors.grey[400],),
          ),
          Row(
            children:
            [
              const CircleAvatar(
                radius: 17,
                backgroundImage:   NetworkImage('https://thumbs.dreamstime.com/b/young-hipster-blogger-traveler-denim-jacket-navigator-smartphone-connected-to-g-internet-close-up-portrait-handsome-94033303.jpg'),
              ),
              const SizedBox(width: 10,),
              MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: ()
                {

                },
                child:  Text('write a comment ...',style: TextStyle(color: Colors.grey[600])),
              ),
              const Spacer(),
              InkWell(
                onTap: ()
                {

                },
                child: Row(
                  children:
                  [
                    const Icon(IconBroken.Heart,size: 16,),
                    const SizedBox(width: 5,),
                    Text('Like',style: TextStyle(color: Colors.grey[600],fontSize: 10,fontWeight: FontWeight.bold),),
                  ],),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
