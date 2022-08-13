
// ignore_for_file: constant_identifier_names


 import 'package:mindo/screens/school_level/foundation_stage_home_screen.dart';

class Stages{
   static List<Map> levels=[
   {
     'title':'Foundation Stage',
     'subtitle':'Nursery to 3rd Class',
     'route':const FoundationHomeScreen(),
   },
   {
     'title':'Preparatory Stage',
     'subtitle':'3rd to 6th Class',
     'route':const FoundationHomeScreen(),
   },
   {
     'title':'Middle Stage',
     'subtitle':'7th to 9th Class',
     'route':const FoundationHomeScreen(),
   },
   {
     'title':'Secondary Stage',
     'subtitle':'10th to 12th Class',
     'route':const FoundationHomeScreen(),
   },

   {
     'title':'University Level',
     'subtitle':'',
     'route':const FoundationHomeScreen(),
   }
 ];

   static Map<String,List<Map>> sections={
     '0':[
       {
         't':'MindFul Eating',
         'i':'assets/images/activities/eating.png'
       },
       {
         't':"FOCUSED\nBREATHING",
         'i':'assets/images/activities/breathing.png'
       },
       {
         't':"LISTENING &\nOBSERVING",
         'i':'assets/images/activities/listen.png'
       },
       {
         't':"MINDFUL INTERACTIONS",
         'i':'assets/images/activities/interaction.png'
       },
       {
         't':"EMOTIONS &\nTHOUGHTS",
         'i':'assets/images/activities/emotions.png'
       },
       {
         't':"PAUSING FOR\nA MOMENT",
         'i':"assets/images/activities/pause.png"
       },
       {
         't':"MY DIARY",
         'i':"assets/images/activities/diary.png"
       },
       {
         't':"KIDS YOGA",
         'i':"assets/images/activities/yoga.png"
       }
     ]
   };

}