import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  //TODO:add complete answer to your list and show  on screen
  //TODO:you can add another class like sport quiz brain
  //TODO:over flow pixels
  final List<Question> _questionAnswerBank = [
    Question('Sea otters have a favorite rock they use to break open food.',
        true, 'they keep these treasures in the loose skin under their arms.'),
    Question(
        'You can lead a cow down stairs but not up stairs.', false, "false"),
    Question('Approximately one quarter of human bones are in the feet.', true,
        "true"),
    Question('A slug\'s blood is green.', true, "true"),
    Question(
        'Sharks are mammals', false, 'they are actually classified as fish.'),
    // Question(' The blue whale is the biggest animal to have ever lived.', true,
    //     'and that includes dinosaurs!'),
    // Question(' The hummingbird egg is the world\'s smallest bird egg.', true,
    //     ' on the flip side, ostriches lay the largest eggs.'),
    // Question('Pigs roll in the mud because they don’t like being clean.', false,
    //     'pigs have few sweat glands and their muddy baths help keep them cool.'),
    // Question('bats are blind.', false,
    //     'bats often find their way using ultrasound but their eyes work, just not particularly well'),
    // Question('A dog sweats by panting its tongue.', false,
    //     'canines sweat through glands in their paws.'),
    // Question('It takes a sloth two weeks to digest a meal.', true,
    //     'that’s the slowest digestion time of any mammal!'),
    // Question(
    //     ' The largest living frog is the Goliath frog of West Africa..',
    //     true,
    //     'this amphibian reaches lengths of 12.5 inches and weighs 7.2 pounds.'),
    // Question('An ant can lift 1,000 times its body weight..', false,
    //     'ants can lift 5,000 times their body weight!'),
    // Question(
    //     'When exiting a cave, bats always go in the direction of the wind.',
    //     false,
    //     ' bats always turn left out of a cave.'),
    // Question('Galapagos tortoises sleep up to 16 hours a day.', true,
    //     'and they can go a year without food or water, so they have lots of time for extra sleep.'),
    // Question(' An octopus has seven hearts.', false,
    //     'it has three hearts and they do a lot of work. One heart circulates blood around the body and the other two pump blood past the gills and pick up oxygen.'),
    // Question('The goat is the national animal of Scotland.', false,
    //     'it is the unicorn.'),
    // Question(
    //     ' Carnivores are animal eaters.', false, 'herbivores only eat plants.'),
    // Question(' A monkey was the first non-human to go into space.', false,
    //     'fruit flies were the first to make the trip.'),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionAnswerBank.length - 1) {
      _questionNumber++;
    } else {
      _questionNumber = 0;
    }
  }

  String getQuestionText() {
    return _questionAnswerBank[_questionNumber].question;
  }

  bool getQuestionAnswer() {
    return _questionAnswerBank[_questionNumber].answer;
  }

  String getQuestionComplete() {
    return _questionAnswerBank[_questionNumber - 1].completeAnswer;
  }

  void resetQuestionNumber() {
    _questionNumber = -1;
  }

  bool isFinished() {
    if (_questionNumber >= _questionAnswerBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
}
