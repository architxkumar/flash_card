class QuizQuestion {
  final String question;
  final String answer;
  final String category;

  QuizQuestion({
    required this.question,
    required this.answer,
    required this.category,
  });
}

final List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: "What is the difference between var, dynamic, and Object in Dart?",
    answer:
        "var is type-inferred at compile time and cannot change types; dynamic can hold any type and is checked at runtime; Object is the base class of all Dart objects and requires explicit casting.",
    category: "dart",
  ),
  QuizQuestion(
    question: "What are mixins in Dart and how do they differ from inheritance?",
    answer:
        "Mixins allow code reuse across multiple class hierarchies without using inheritance. They are applied using 'with' keyword and can add functionality to classes without requiring a parent-child relationship.",
    category: "dart",
  ),
  QuizQuestion(
    question: "Explain the difference between async and async* in Dart.",
    answer:
        "async returns a Future and completes once; async* returns a Stream and can yield multiple values over time using the yield keyword.",
    category: "dart",
  ),
  QuizQuestion(
    question: "What is the purpose of the late keyword in Dart?",
    answer:
        "late allows non-nullable variables to be initialized after declaration, enforcing that they must be assigned before use. It's useful for lazy initialization and avoiding null checks.",
    category: "dart",
  ),
  QuizQuestion(
    question: "What is the difference between == and identical() in Dart?",
    answer:
        "== checks for value equality (can be overridden) while identical() checks if two references point to the exact same object in memory.",
    category: "dart",
  ),

  // Flutter Questions
  QuizQuestion(
    question: "What is the difference between StatelessWidget and StatefulWidget?",
    answer:
        "StatelessWidget is immutable and doesn't maintain state; StatefulWidget has mutable state that can change over time and trigger rebuilds using setState().",
    category: "flutter",
  ),
  QuizQuestion(
    question: "Explain the widget tree, element tree, and render tree in Flutter.",
    answer:
        "Widget tree defines the UI configuration; element tree manages widget instances and their lifecycle; render tree handles layout and painting. Widgets are immutable configs, elements are mutable instances.",
    category: "flutter",
  ),
  QuizQuestion(
    question: "What is the difference between mainAxisAlignment and crossAxisAlignment?",
    answer:
        "mainAxisAlignment aligns children along the main axis (horizontal for Row, vertical for Column); crossAxisAlignment aligns children along the perpendicular cross axis.",
    category: "flutter",
  ),
  QuizQuestion(
    question: "What are Keys in Flutter and when should you use them?",
    answer:
        "Keys preserve state when widgets move in the tree. Use them when you need to preserve state across widget rebuilds, especially with lists, reorderable items, or when widgets change position.",
    category: "flutter",
  ),
  QuizQuestion(
    question: "What is the difference between hot reload and hot restart?",
    answer:
        "Hot reload injects updated code while preserving app state; hot restart fully restarts the app, losing all state. Hot reload is faster but can't handle some changes like adding new files or changing app initialization.",
    category: "flutter",
  ),
  QuizQuestion(
    question: "Explain InheritedWidget and its purpose.",
    answer:
        "InheritedWidget efficiently propagates data down the widget tree. Child widgets can access it without passing data through constructors. It's the foundation for state management solutions like Provider.",
    category: "flutter",
  ),
  QuizQuestion(
    question: "What is the difference between Expanded and Flexible widgets?",
    answer:
        "Both occupy available space in Row/Column. Expanded forces the child to fill available space (fit: FlexFit.tight), while Flexible allows the child to be smaller (fit: FlexFit.loose by default).",
    category: "flutter",
  ),

  // Golang Questions
  QuizQuestion(
    question: "What is the difference between var, := , and const in Go?",
    answer:
        "var declares variables with explicit or inferred types; := is short declaration (type inferred, function scope only); const declares compile-time constants that cannot change.",
    category: "golang",
  ),
  QuizQuestion(
    question: "Explain goroutines and how they differ from threads.",
    answer:
        "Goroutines are lightweight, multiplexed onto OS threads by the Go runtime. They have smaller stack sizes (2KB vs 1MB+), cheaper creation, and the scheduler manages thousands efficiently. Use 'go' keyword to launch.",
    category: "golang",
  ),
  QuizQuestion(
    question: "What is the difference between buffered and unbuffered channels?",
    answer:
        "Unbuffered channels block until both sender and receiver are ready (synchronous). Buffered channels allow sending up to capacity without blocking, only blocking when full (sender) or empty (receiver).",
    category: "golang",
  ),
  QuizQuestion(
    question: "What are defer statements and when are they executed?",
    answer:
        "defer postpones function execution until the surrounding function returns. Multiple defers execute in LIFO order. Commonly used for cleanup like closing files or unlocking mutexes.",
    category: "golang",
  ),
  QuizQuestion(
    question: "Explain interfaces in Go and empty interface{}.",
    answer:
        "Interfaces define method sets; types implicitly satisfy them. interface{} (or 'any' in Go 1.18+) accepts any type since all types implement zero methods. Used for generic containers before generics.",
    category: "golang",
  ),
  QuizQuestion(
    question: "What is the difference between value receivers and pointer receivers?",
    answer:
        "Value receivers get a copy of the type; pointer receivers get a pointer to the original. Use pointers to modify the receiver or avoid copying large structs. Methods with pointer receivers can only be called on pointers or addressable values.",
    category: "golang",
  ),
  QuizQuestion(
    question: "What are slices and how do they differ from arrays?",
    answer:
        "Arrays have fixed size; slices are dynamic views over arrays with length and capacity. Slices are reference types (share underlying array), arrays are value types (copied when assigned).",
    category: "golang",
  ),
  QuizQuestion(
    question: "Explain the select statement in Go.",
    answer:
        "select allows waiting on multiple channel operations simultaneously. It blocks until one case can proceed, choosing randomly if multiple are ready. Used for timeouts, cancellation, and multiplexing channels.",
    category: "golang",
  ),
];
