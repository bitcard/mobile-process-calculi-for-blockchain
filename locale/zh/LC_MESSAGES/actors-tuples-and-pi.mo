��    h      \  �   �      �     �     �     �     �     �  	   	     	  x   	  �   �	  U   >
  �   �
  S   #  %  w  8   �  8   �  �    &   �     
  <     �  ]  �  W  �  �  D  �  �  �  �  �#  \  �'  O  4*  u  �,  5   �.  �  0/     �0     �0  �   1  K   �1  E  �1  y   3  P   �3  �  �3  [  �6  )   /8  �   Y8  �  D9  +   .;  �  Z;  *   ;>  �  f>  -  @  %   /A  d   UA  T   �A  ^   B     nB     {B     �B  g  �B  .  �E  #   #I  j   GI  �  �I  g   �M  #  N  �   =P  P   �P  1   :Q  ,  lQ  (  �U  u  �V  �  8Z  �  -]  �  �^  �  �`     cc      }c     �c  �   �c  �  �d  6   Zf  "  �f  ?  �i     �n  D   o  Z   Po  7   �o     �o  �   �o     �p     �p     �p     �p  B   �p  )   �p     !q     3q     Bq     Kq     Sq     hq     lq     qq  	   wq  �   �q  �   r  �   �r  s  �s     +u     3u     Lu     Xu     `u  	   iu     su  X   �u  �   �u  F   {v  b   �v  @   %w  �   fw  %   Xx  %   ~x  9  �x     �{     �{  �  |  f  �}  �  Q�  A  ڂ    �  1  ��    ΋    �    �  �  �  $   �  m  >�     ��     ��  r   ݖ  6   P�  8  ��  `   ��  >   !�  ^  `�    ��  !   ܜ  �   ��  �  ��  !   G�  &  i�     ��  �  ��  �   2�  $   !�  H   F�  N   ��  L   ޤ  	   +�     5�     =�  �  F�  �  9�     Ū  d   ު  Y  C�  T   ��  �  �  �   ��  @   3�  *   t�  �  ��  �   8�  �  -�  y  ָ  v  P�  �  Ǽ  ;  I�     ��     ��     ��  �   ��  l  ��  -   ��  Z  $�  !  �     ��  7   ��  A   ��  -   1�  &   _�  �   ��  	   �      �     2�     A�  ?   E�  *   ��     ��     ��  	   ��     ��     ��     ��     ��     ��  	   �  �   �  {   ��  �   /�     +   `         <       I   h       c                 9       	   ;       @   X               T   *   &       !   H      F                         W       .   #       7                 A      b   V   ]   =   e   E   3   C   1          Y   O   K          U      J      '   \      a          P   :              B      %      Z   ?   _   
                 >   g   M   ^       N   -         R   2      L       D   "   G       6          /       $   )   f   ,   (      Q   [                  0   S   8       d   4              5    **get** **publish with history** **publish** **put** **read** **store** **subscribe** :code:`(def X( ptrn ) = P)[ m ]` and :code:`X( m )`, these are the process forms for recursive definition and invocation :code:`(new x)P` is the form of a process that executes a subprocess, P, in a context in which x is bound to a fresh channel, distinct from all other channels in use :code:`0` is the form of the inert or stopped process that is the ground of the model :code:`P|Q` is the form of a process that is the parallel composition of two processes P and Q where both processes are executing concurrently :code:`x!( m )` is the form of sending a message, :code:`m`, on a channel :code:`x` :code:`x?( ptrn )P` is the form of an input-guarded process waiting for a message on channel :code:`x` that matches a pattern, ptrn, and on receiving such a message will continue by executing :code:`P` in an environment where any variables in the pattern are bound to the values in the message A Rosette implementation of the tuplespace get semantics A Rosette implementation of the tuplespace put semantics A notable difference between the tuplespace notion of coordination and the actor model lies in the principal port limitation of actors. An actor has one place, its mailbox, where it is listening to the rest of the world. Real systems and real system development require that applications often listen to two or more data sources and coordinate across them. Fork-join decision procedures, for example, where requests for information are spawned to multiple data sources and then the subsequent computation represents a join of the resulting information streams from the autonomous data sources, are quite standard in human decision making processes, from loan processing, to the review of academic papers. Of course it is possible to arrange to have an actor that coordinates amongst multiple actors who are then charged with handling the independent data sources. This introduces application overhead and breaks encapsulation as the actors need to be aware they are coordinating. A pre-RChain model for smart contracts Actors, Tuples and π Already, this is a much more deliberately articulated model of actors than exists in most industrial systems today (cf Scala’s AKKA framework). What makes the Rosette model so much more elegant, however, is its total commitment to meta-level programming. In the Rosette model, everything is an actor. In particular, the mailbox of an actor is an actor, and that has, in turn, a mailbox, state, meta, and sbo. It is noteworthy that Rosette makes this fully reflective model with the possibility of infinite regress perform on par or better than languages like Java or C#. An actor provides a consistent view of state under concurrent execution via an update; that is, an actor does not process the next message in the mailbox until it has called update, and while the actor is processing the current message, the mailbox is considered locked and is queuing client requests. When an actor calls an update a new logical thread of activity is created to process the next message in the mailbox queue. That thread’s view of the state of the actor is whatever is supplied to the update. The previous thread may still make changes to the state, but they are not observable to all subsequent threads processing subsequent messages in the mailbox, and hence to all subsequent client requests. This approach provides a scalable notion of concurrency that collapses to message arrival order non-determinism in single threaded containers, and expands when there is system level support to map the logical threads in some outer container (such as a VM, an operating system, or the hardware, itself). An actor’s processing consists of reading the next message in the mailbox, using the shared behavior object (or sbo) to determine which code to run in response to the message and then execute that code in an environment in which references to keys described in the meta are bound to locations in the state tuple. That code will principally send messages to other actors and possibly await for responses. Around the same time as the Rosette model was being investigated for developing applications in this decentralized and distributed setting, Gelernter proposed Tuplespaces. Here the idea is to create a logical repository above the physical and communications layers of the Internet. The repository is essentially organized as a distributed key-value database in which the key-value pairs are used as communication and coordination mechanisms between computations. Gelernter describes three basic operations for interaction with the tuplespace, :code:`out` to create a new data object in tuplespace, :code:`in` to consume (remove) an object from tuple space and :code:`rd` to read an object without removing it As seen in the rholang design, however, this is only the beginning of the story. A little background is necessary to understand the import or this development. For the last 20 years a quiet revolution has been going on in computer science and logic. For many years it was known that for small, but growing fragment of the functional programming model types corresponded to propositions, and proofs corresponded to programs. If the correspondence, known variously as the proposition-as-types paradigm or the Curry-Howard isomorphism, could be made to cover a significant, practical portion of the model, it has profound implications for software development. At a minimum it means that the standard practice of type-checking programs coincides with proofs that programs enjoy certain properties as a part of their execution. The properties associated with the initial fragment covered by the Curry-Howard isomorphism largely had to do with respecting the shape of data flowing into and out of functions, effectively eliminating certain class of memory access violations by compile time checks. As we will see, the RChain model for contracts inherits all of SpecialK’s treatment of content delivery. Yet, where SpecialK realized the pre-RChain contract model as an embedded domain specific language hosted as a set of libraries in Scala, the RChain model realizes the model as a full blown programming language to be run on a VM replicated on the blockchain, very much in the spirit of Ethereum’s architecture and design. This choice addresses several shortcomings in the Synereo V1 architecture as outlined in the first Synereo white paper. In particular, it avoids the problem of having to pay other blockchains fees to run the financial capabilities of the attention economy, and thus suffering a number of economics-based attacks on the attention economy system contracts. It also addresses technical debt in the SpecialK stack related to the Scala delimited continuations library central to the SpecialK semantics, while dramatically increasing the capability of the smart contracts supported. As with the refinements Rosette brings to the actor model, the π-calculus brings a specific ontology for applications built on the notion of processes that communicate via message passing over channels. It is important to note that the notion of process is parametric in a notion of channel, and Meredith used this level of abstraction to provide a wide variety of channel types in XLang, including bindings to Microsoft’s MSMQ message queues, COM objects, and many other access points in popular technologies of the time. Perhaps most central to today’s Internet abstractions is that URIs provide a natural notion of channel that allows for a realization of the programming model over URI aware communications protocols, such as http. Likewise, in terms of today’s storage climate, keys in a key-value store, such as a nosql database also map directly to the notion of channel in the π-calculus, and Meredith used this very idea to provide the encoding of the π-calculus into tuplespace semantics. At MCC the Carnot research group predicted the commercialization of the Internet a full decade before Netscape rose to fame. The Carnot group, however was focused on decentralized and distributed applications, and developed a network application node, called the Extensible Services Switch, or ESS, and the programming language Rosette for programming these nodes. In Rosette/ESS the model under investigation was the actor model. Here we are speaking quite specifically of an elaboration of the model developed by Carl Hewitt and refined by Gul Agha, who subsequently consulted on the design of Rosette. Before diving into how the model relates to resource addressing, content delivery, query and sharding, let’s make a few quick observations about path-based addressing. Note that paths don’t always compose. For example, take `/a/b/c` and `/a/b/d`. These don’t compose naturally to yield a path. However, every path is automatically a tree, and as trees these do compose to yield a new tree `/a/b/c+d`. In other words, trees afford a composable model for resource addressing. This also works as a query model. To see this latter half of this claim let’s rewrite our trees in this form: Building on Tomlinson’s insights about the use of Rosette’s reflective methods to model the tuplespace semantics (see code above), Meredith provided a direct encoding of the π-calculus into tuplespace semantics via linear continuations. This semantics was at the heart of Microsoft’s BizTalk Process Orchestration Engine, and Microsoft’s XLang, arguably the first Internet scale smart contracting language, was the resulting programming model. This model was a direct influence on W3C standards, such as BEPL and WS-Choreography, and spawned a whole generation of business process automation applications and frameworks. Distributed implementations of mobile process calculi Essentially, the question is what happens to either or both of data and continuation after an input request meets an output request. In traditional tuplespace and π-calculus semantics both data and continuation are removed from the store. However, it is perfectly possible to leave either or both of them in the store after the event. Each independent choice leads to a different major programming paradigm. From SpecialK to RChain From Tuplespaces to π-calculus If we look at this from the perspective of programming language evolution, we first see a refactoring of the semantics to look like: Implications for resource addressing, content delivery, query, and sharding In contrast to message passing systems this approach allows senders and receivers to operate without any knowledge of each other. When a process generates a new result that other processes will need, it simply dumps the new data into tuplespace. Processes that need data can look for it in tuple space using pattern matching. In contrast, the tuplespace model is well suited to computations that coordinate across multiple autonomous data sources. In light of this discussion, let’s look at the I/O actions of the π-calculus: In some sense, the structural reflection of actors in the Rosette model is echoed in languages like Java where classes are in turn objects that can be programmatically probed and enlisted in computation. However, Rosette takes the reflective principle a step further. The model offers not just structural reflection, but procedural reflection, by providing a notion of continuation reconciled with the concurrency inherent in the model. Specifically, just as a shift-block in a shift-reset style presentation of delimited continuations makes the awaiting continuation available to the code in the block, Rosette’s reflective method makes the awaiting continuation available as a parameter to the method in the body of the method. More on this later. In the code depicted below the method names consume and produce are used instead of the traditional Linda verbs :code:`in` and :code:`out`. The reason is that once reflective method strategy was discovered, and then refined using delimited continuations, this lead to new vital observations relating to the life cycle of the data and continuation. Input queries for resources at locations: It contrasts with the join-calculus where the join is inseparably bound together with recursion. The monadic input guard allows for anonymous, one time joins, which are quite standard in fork-join patterns in human decision processes. It provides the proper setting in which to interpret Kiselyov’s LogicT monad transformer. Searching down each input source until a tuple of inputs that satisfies the conditions is found is sensitive to divergence in each input source. Fair interleaving, and more importantly, a means to programmatically describe interleaving policy is critical for reliable, available, and performant services. This is the actual import of LogicT and the right setting in which to deploy that machinery. Item-level locking in a distributed setting Meredith then pursued two distinct lines of improvement to these features. Both of them are related to channel abstraction. The first of these relates the channel abstraction to the stream abstraction that has become so popular in the reactive programming paradigm. Specifically, it is easy to prove that a channel in the asynchronous π-calculus corresponds to an unbounded and persistent queue. This queue can be viewed as a stream, and access to the stream treated monadically, as is done in the reactive programming paradigm. This has the added advantage of providing a natural syntax and semantics for the fork-join pattern so prevalent in concurrent applications supporting human decision making applications mentioned previously. Monadically structured channel abstraction Now compare this starting point to Ethereum’s current point with Solidity and the EVM. If the goal is to produce a believable timeline over which we reach a network of blockchain nodes running formally verified, correct-by-construction code, then even with Ethereum’s network effect this approach has distinct advantages. Clearly, there is enough market interest to support the development of both options. Now we have a complete characterization of the RChain model of smart contracts. It is codified in the rholang design. The number of features it enjoys as a result of reflection alone, from macros to protocol adapters, is enough to warrant consideration.Taking a step back, however, we see further that Output places resources at locations: Removing both data and continuation is the standard mobile process calculi and tuplespace semantics: Removing the continuation but leaving the data constitutes a standard database read: Removing the data, but leaving the continuation constitutes a subscription in a pub/sub model: Rho-calculus Rosette SpecialK Taking a cue from Rosette’s total commitment to meta-level programming, the **r**-eflective **h**-igher **o**-rder π-calculus, or rho-calculus, for short, introduces reflection as part of the core model. It provides two basic primitives, reflect and reify, that allow an ongoing computation to turn a process into a channel, and a channel that is a reified process back into the process it reifies. The model has been peer reviewed multiple times over the last ten years. Prototypes providing a clear demonstration of its soundness have been available for nearly a decade. This takes the set of contract building primitives to a grand total of nine primitives, far fewer than found in Solidity, Ethereum’s smart contracting language, yet the model is far more expressive than Solidity. In particular, Solidity-based smart contracts do not enjoy internal concurrency. Taking a more narrow perspective, it is useful to witness the painful experiences of Scala to add support for meta-level programming after the fact of the language design. Reflection in Scala was not even thread safe for years. Arguably, this experience, plus the problems with the type system were the reasons for the back-to-the-drawing board effort underlying the dotty compiler and new language design. These and other well explored efforts make it clear that providing primitives for meta-level programming from the outset of the core design of the programming model is essential for longevity and practical use. In short, a design that practically supports meta-level programming is simply more cost effective in a project that wants to get to production-ready feature set on par with say Java, C#, or Scala. The RChain model of smart contracts The Rosette elaboration was striking in scope and elegance. Specifically, Rosette decomposes an actor into The monadic treatment of channel semantics is the insight explored in the SpecialK stack. Firstly, it maps channel access to for-comprehension style monadically structured reactive programming. Secondly, it maps channels simultaneously to local storage associated with the entire node, as well as to queues in an AMQP provider based communication infrastructure between nodes. This provides the basis of a content delivery network that can be realized over a network of communicating nodes, that is integrated with a π-calculus based programming model. In particular, as can be seen in the comments in the code above, the monadic treatment of channel + pattern unifies message-passing and content delivery programming paradigms. Specifically, the channel can be seen as providing topic, while the pattern provides nested subtopic structure to the message stream. This integrates all of the standard content addressing mechanisms, such as URLs + http, as well as providing a query model. See the section below for details. The second three are about the concurrent nature of processes, the creation of channels, and recursion. The π-calculus captures a core model of concurrent computation built from message-passing based interaction. It plays the same role in concurrent and distributed computation as the lambda calculus plays for functional languages and functional programming, setting out the basic ontology of computation and rendering it to a syntax and semantics in which calculations can be carried out. Given some notion of channel, it builds a handful of basic forms of process, the first three of which are about I/O, describing the actions of message passing. Then notice that unification works as a natural algorithm for matching and decomposing trees, and unification-based matching and decomposition provides the basis of query. These basic forms can be interpreted in terms of the operations on Tuplespaces:: This gives rise to a very natural interpretation: This is a precursor to the RChain model for smart contracts, as codified in the rholang design. It provides the richest set of communication primitives for building contracts proposed to date that has been driven both by theory and by industrial scale implementation and deployment. Yet, the entire set of contract primitives fits on a single line. There is not a single design proposal in this space, from the PoW-based blockchain to the EVM, that meets the quality assurance pressures this proposal has withstood. Specifically, the proposal folds in all the experiences using Rosette, Tuplespaces, and BizTalk and boils them down to a single design that meets the desiderata discovered in all of these efforts. It does so with only seven primitives, and primitives that line up with the dominant programming paradigms of the current market. Yet, as the examples from the rholang spec, and the paper on preventing the DAO bug with behavioral types show, the entire range of contracts expressible in existing blockchain technology is compactly expressed in this model. This is only the beginning of the story. With reflection we admit structure on channel names, like x in the example above, themselves. This allows to subdivide the space where resources are stored via namespaces. Namespaces become the basis for a wide range of features from security to sharding. This point is worth discussing in more detail. While the π-calculus does resolve the principle port limitation of the actor model, it does not provide natural syntactic or semantics support for the fork-join pattern. Some variants of the π-calculus, such as the join calculus, have been proposed to resolve this tension, but arguably those proposals suffer an entanglement of features that make them unsuited to many distributed and decentralized programming design patterns. Meanwhile, the monadic interpretation of the channel provides a much more focused and elementary refactoring of the π-calculus semantics, consistent with all existing denotational semantics of the model, that provides a natural notion of fork-join while also mapping cleanly onto the reactive programming paradigm, and thus making integration of development stacks, such as Apache Spark, relatively simple. This raises questions about how  publication of data is persisted and what happens to computations suspended waiting on key-value pairs that are not present in the tuplespace. Moreover, the tuplespace mechanism makes no commitment to any programming model. Agents using the tuplespace may be written in a wide variety of programming models with a wide variety of implementations and interpretations of the agreed concurrency semantics. This makes reasoning about the end-to-end semantics of an application made of many agents interacting through the tuplespace much, much harder. However, the simplicity of the communication and coordination model has enjoyed wide appeal and there were many implementations of the tuplespace idea over the ensuing decades. This refactoring shows up in Meredith and Stay’s work on higher categorical semantics for the π-calculus :cite:`DBLP:journals/corr/StayM15`, and is then later incorporated in the rholang design. The important point to note is that the for-comprehension-based input can now be smoothly extended to input from multiple sources, each/all of which must pass a filter, before the continuation is invoked. To close out this brief summary note that Rosette was not merely structurally and procedurally reflective, but also lexically reflective. That is, all syntactic structure of programs in Rosette are also actors! The reflective infrastructure for this provides the basis for a hygienic macro system, support for embedded domain specific languages, and a host of other syntactic and symbolic processing features that many industrial languages still struggle to provide some 20 years after Rosette’s inception. Tomlinson, Lavender, and Meredith, among others, provided a realization of the tuplespace model inside Rosette/ESS as a means to investigate the two models side-by-side and compare applications written in both styles. It was during this work that Meredith began an intensive investigation of the mobile process calculi as yet a third alternative to the actor model and the tuplespace model. One of the primary desiderata was to bridge between having a uniform programming model, such as the actor model of Rosette, making reasoning about application semantics much easier, with the simple, yet flexible notion of communication and coordination afforded in the tuplespace model. Traditional DB operations Traditional messaging operations Tuplespaces Using a for-comprehension allows the input guard semantics to be parametric in the monad used for channels, and hence the particular join semantics can be supplied polymorphically. The significance of this cannot be overemphasized. Specifically: We now have a syntactic form for nested transactions. Specifically, :code:`P` can only run in a context in which all of the state changes associated with the input sources and the condition are met. Further, :code:`P` can be yet another input-guarded process. Thus a programmer, or a program analyzer, can detect transaction boundaries *syntactically*. This is vital for contracts involving financial and other mission-critical transactions. When these are placed in concurrent execution we have: While the monadic abstraction provides structure on the stream of content flowing over channels a more fundamental observation provides the necessary structure to support industrial scale meta-level programming. It is important to recognize that virtually all of the major programming languages support meta-level programming. The reason is simply fact that programmers don’t write programs. Programs write programs. Programmers write the programs that write programs. This is how the enormous task of programming at Internet scale is actually accomplished, using computers to automate as much of the task as possible. From text editors to compilers to code generators to AI, this is all a part of the basic ecosystem that surrounds the production of code for services that operate at Internet scale. With the advent of J-Y Girard’s linear logic, we have seen a dramatic expansion of the proposition-as-types paradigm. With linear logic we see the expansion of the coverage far beyond the functional model, which is strictly sequential. Instead, the coverage offered by type checking for proving properties extends to protocol conformance checks in concurrent execution. Then Caires and Cardelli discovered the spatial logics which further expanded the coverage to include structural properties of the programs internal shape. Building on these discoveries, Stay and Meredith identified an algorithm, the LADL algorithm, for generating type systems such that well typed programs would enjoy a wide variety of structural and behavioral properties ranging from safety and liveness to security properties. By the application of the LADL algorithm developed by Stay and Meredith, this untyped model of the contract primitives identified here can be given a sound and complete type system rich enough to provide compile time safeguards that ensure key safety and liveness properties expected of mission-critical applications for handling financial assets and other sensitive content. A single example of such a compile time safeguard is sufficient to have caught and prevented the bug that led to the loss of 50M USD from the DAO, at compile time. a formal specification a mailbox (a queue where messages from the actor’s clients arrive) a meta (a description of how to access values in the state in terms of more abstract keys) a rendering of the formal specification to working code a state (a tuple of values) and a shared behavior object (a map from message types to code to run in response, roughly equivalent to a vtable in languages like C++) consumer ephemeral - data ephemeral - k get it dictates a formal specification of a correct-by-construction VM it enjoys a sound and correct type system persistent - data persistent - k producer publish publish with history put read store subscribe this dictates a clear compilation strategy as a series of correct-by-construction transforms to the byte code for a VM that has been field test for 20 years where the for-comprehension is syntactic sugar for a use of the continuation monad. The success of this interpretation suggests a refactoring of the **source** of the interpretation. which evaluates to :code:`P{ X := c, Y := d }`, that is we begin to execute :code:`P` in an environment in which :code:`X` is bound to :code:`c`, and :code:`Y` is bound to :code:`d`. We write the evaluation step symbolically: Project-Id-Version: Mobile process calculi for programming the blockchain 1.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2018-01-16 22:11+0800
PO-Revision-Date: 2018-03-18 16:00+0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.3.4
Last-Translator: 
Language-Team: 
Language: pi
X-Generator: Poedit 2.0.5
 **get** **publish with history** **publish** **put** **read** **store** **subscribe** :code:`(def X( ptrn ) = P)[ m ]` 和 :code:`X( m )` 表示进程的递归定义和执行 :code:`(new x)P` 表示一个执行子进程P的进程，在它的上下文中，x被绑定到一个新的信道，不同于所有其他正在被使用的信道 :code:`0` 表示惰性或已停止的进程，是模型的基础情况 :code:`P|Q` 表示由两个进程P和Q并行组成的进程，这两个进程是并发执行的。 :code:`x!( m )` 表示在信道 :code:`x` 发送消息 :code:`m` :code:`x?( ptrn )P` 表示输入看守进程正在监听信道 :code:`x` ，等待与模式相匹配的消息，然后当接收到该信息后，会接着执行:code:`P`，其中模式中的所有变量会被绑定到消息中对应的值。 元组空间get语义的Rosette实现 元组空间put语义的Rosette实现 元组空间概念与actor模型之间的显着区别在于actor模型基本端口的限制。一个actor有一个位置，即它的邮箱，监听世界其他地方的行为。现实中的系统和系统开发通常要求应用程序监听两个以上的数据源，并在它们之间进行协调。例如，Fork-join的程序，会spawn出多个程序对多个数据源请求信息，然后后续的计算过程将这些来自自动化数据源的结果信息流合并，这种算法是人类决策过程中一种常见的想法，应用于诸如从贷款处理，到学术论文的审查。当然，可以安排一个actor在多个actor之间进行协调，然后负责这些独立的数据源的处理。但这在应用程序中引入了开销，并打破了封装，因为参与者必须要知道他们正在被协调。 前RChain智能合约模型 Actors, 元组和π演算 这已经是一个比当今大多数工业系统中已有的actor模型（比如Scala的AKKA框架）更具表达能力的模型。然而，Rosette模型更加优雅的是它对元编程的全部承诺。在Rosette模型中，一切都是actor。特别是，actor的邮箱是actor，而邮箱，状态，元信息和sbo都是actor。值得注意的是，Rosette使得这个完全反射模型具备无限回归到与Java或C#等语言相同或更好性能的可能性。 Actor通过更新，在并发执行中提供一个一致的状态视图，更具体地说，一个actor直到它被更新之后才会处理邮箱中的下一条消息，并且当actor正在处理当前消息时会将邮箱上锁，以及将客户端的请求进行按序缓存。当一个actor调用了更新操作，一个新的逻辑线程将被创建来处理邮箱队列中的下一条信息。线程对该actor状态的视图全部都提供给了此次更新。前面的线程可能仍然会对状态进行更改，但是这些对后面处理邮箱中后续消息的线程都是不可见的，因此对后续的客户端请求也是不可见的。这种方法提供了一种可伸缩的并发概念，从消息抵达顺序不确定的单线程容器，扩展到某些系统级支持逻辑线程映射的外部容器(例如虚拟机，操作系统或硬件本身)。 Actor的处理过程包括从邮箱中读取下一条信息，使用共享的行为对象(share behavior object, sbo)来确定使用哪些代码进行执行以得到针对该消息的响应，然后在执行环境中运行代码，在该执行环境中元信息所引用的键被绑定到状态元组对应的位置。该代码主要将消息发给其他actor，之后可能在等待响应。 大约在Rosette模型被研究用于在去中心化和分布式环境中开发应用的同时，Gelernter提出了Tuplespaces。他的想法是在互联网的物理层和通信层之上创建一个逻辑仓库。该仓库基本上被组织为分布式键值数据库，其中键值对被用作计算之间的通信和协调机制。 Gelernter描述了与元组空间交互的三个基本操作： :code:`out` 用于在元组空间创建一个新的数据对象，:code:`in` 从元组空间消费（移除）一个对象，以及 :code:`rd` 读取一个对象并且不移除它 然而, 正如在 rholang 设计中所看到的, 这只是故事的开始。为了理解在开发引入的这些概念，读者需要一些背景知识。在过去的20年里, 一场革命已在计算机科学和逻辑学中悄然发生。许多年来人们都知道, 对于函数式编程模型中的小而增长的代码片段中，类型对应于命题, 证明对应于编程。如果这种对应，五花八门地被称为类型即命题范式或Curry-Howard 同构, 可以被用来涵盖模型中的一个重要而实用的部分, 它对软件开发有着深远的影响。至少, 这意味着, 类型检查程序的标准实践与程序证明在执行过程中拥有一致的某些属性。与Curry-Howard 同构所覆盖的初始片段相关的属性，主要与相关形式的函数中输入输出数据有关, 通过编译时检查，有效地消除了这类内存访问违规的行为. 正如我们将看到的，RChain合约模型继承了SpecialK对待内容交付的所有优点。但是，SpecialK所实现的前RChain合约模型是以嵌入领域专用语言作为Scala的一组类库，而RChain则将该模型实现为全面的编程语言，运行在区块链上复制的虚拟机上，极具以太坊的架构和设计理念。该选择解决了第一个Synereo白皮书中指出的几个Synereo 版本1中体系结构的缺点。特别是避免了为运转注意力经济学的财务能力而必须支付给其他区块链费用从而在注意力经济系统合约上遭受了许多基于经济上的攻击的问题。它还解决了与SpecialK语义中心的Scala有限的延续库有关的SpecialK技术栈中的技术债务问题，同时显着提高了其支持的智能合约的能力。 与Rosette为actor模型带来的改进一样，π演算为应用程序提供了一个特定的本体论，这些应用程序是以通过消息传递信道进行通信的进程概念而构建的。需要着重注意，进程是通道中的参数，而Meredith使用这个抽象层次为XLang中提供了各种信道类型，包括绑定到微软的MSMQ消息队列、COM对象和许多其他在当时的流行技术的接入点。也许当今互联网最核心的抽象在于，URI提供了一个自然的信道概念，允许通过URI感知通信协议（如http）实现编程模型。同样，就当今的存储地带而言，键值对存储(如nosql数据库)中的键也直接映射到π演算中的通道概念，而Meredith使用这个构想来提供π演算到元组空间语义的编码。 MCC的Carnot研究小组在网景公司成名整整十年之前就已经预测到了互联网的商业化。然而，Carnot小组专注于去中心化、分布式的应用，并且研发出了一个称为可扩展服务网关(Extensible Services Switch,EXX)的网络应用节点，以及用于在这些节点之上编程的编程语言Rosette。 而Rosette/ESS的研究模型则是actor模型。在这里，我们着重介绍了由Carl Hewitt开发并由Gul Agha精炼的模型，Gul Agha之后为Rosette的设计提供了建议。 在深入研究模型与资源寻址，内容交付，查询和分片的关系之前，让我们先快速地看一下基于路径的寻址。请注意，路径并不总是能够合并。比如`/a/b/c`和`/a/b/d`。这些不会自然地合并成一条路径。然而，每一条路径都是一棵树，而这些树合并了一棵新的树`/a/b/c+d`。换句话说，树为资源寻址提供了一个可组合的模型。这也可以作为查询模型。要看到这个声明的后半部分，让我们用这种形式重写我们的树： 在Tomlinson使用Rosette的反射方法来模拟元组空间语义（见上面的代码）的基础上，Meredith通过线性延续提供了从π演算到元组空间语义的直接编码。这种语义是微软BizTalk的Process Orchestration引擎的核心，微软的XLang可以说是第一个互联网规模的智能合约语言，而它正是由此产生的编程模型。这个模型直接影响到W3C标准，如BEPL和WS-Choreography，并催生了整整一代的业务流程自动化应用和框架。 移动进程演算的分布式实现 本质上，该问题是，在输入请求满足输出请求后数据和延续性，这两个中的一个或两个会发生什么。在传统的元组空间和π演算语义中，数据和连续性都从仓库中移除。然而，事件发生后，完全有可能将其中一个或两个都留在仓库中。每个独立的选择都会导致不同的编程范式。 从SpecialK到RChain 从元组空间到 π演算 如果我们从编程语言演化的角度来看待这个问题，我们首先看到的语义重构看起来像： 资源地址、内容传递、查询和分片的启示 与消息传递系统不同的是，这种方法允许发送者和接收者在彼此不知情的情况下进行操作。当一个进程产生一个其他进程所需要的结果，它只是将新的数据转储到元组空间。需要数据的进程可以使用模式匹配的方法在元组空间中查找它。 相比之下，元组空间模型非常适合协调跨多个自动化数据源的计算过程。 根据这个讨论，我们来看看π演算中的I/O行为： 从某种意义上说，Rosette模型中actor的结构化反射也在Java这样的语言中得到了体现，在这些语言中，类也可以通过编程的方式在计算中依次探测和征募对象。然而，Rosette将反射原理更进一步。该模型通过提供与模型中固有的并发性相一致的延续的概念，不仅提供了结构化反射，而且还提供了程序化反射。具体而言，就像移位复位风格的分隔延续表示中，使用移位块能使等待延续在代码块中可用，Rosette的反射方法使得等待延续可用作方法的参数。稍后再说。 在下面描述的代码中，方法名使用consume和produce来代替传统的Linda动词 :code:`in` 和 :code:`out` 。原因在于，一旦使用了反射法策略，然后使用划定的延续进行细化，这会导致与数据和延续生命周期相关的新的重要观测。 输入查询在位置上的资源 与join-calculus不可分割地绑定在一起的join演算不同。单元守卫输入允许匿名的、一次性合并，这在人类决策过程中是非常标准的fork-join模式。 它提供了用于模拟Kiselyov的LogicT单元转换器的适当配置。在每个输入源搜索直到找到满足条件的输入元组对每个输入源的发散性来说是及其敏感的。更重要的是，公平的交叉是一个描述交织策略的编程算法，它对于可靠，可用和高性能的服务至关重要。这是LogicT的实际导入和在机器部署中的正确设置。 分布式环境下的条目级锁 接着Meredith在两个方向上追求特性的提升。它们都与信道抽象有关。两者中的第一个将信道抽象与在反射编程范式中变得如此受欢迎的流抽象相关联。具体而言，很容易证明异步π演算中的信道对应于无限持久化队列。这个队列可以被视为一个流，并且是可以被单元地处理访问的流，就像在响应式编程范式中所做的那样。这为在前面提到的，支持人类决策应用的常见的fork-join并发模式添加了自然语法和语义的优势。 单子结构化的信道抽象 现在，以这个出发点和以太坊中Solidity和EVM的当前状态做比较。如果目的是产生一个可信的时间线，通过它我们可以得到一个区块链节点网络，在其上面运行形式验证、构建时正确的代码，那么与以太坊网络相比，这种方法也有明显的优势。显然，有足够的市场兴趣来支持这两种选项的发展。 现在我们对RChain智能合约模型已经有一个完整的描述。它编纂在rholang的设计中。它从反射所得到的特性数量，从宏到协议适配器，足以值得引起重视。然而，退一步说，我们将看到 输出将资源置于对应位置： 标准的移动进程演算和元组空间语义会移除数据和延续 移除延续过程而留下数据，这构成一个标准的数据库读取： 将数据移除的同时将延续保留，这组成pub/sub模型中的订阅 Rho演算 Rosette SpecialK 从Rosette对元编程设计的总体承诺中得到一个线索，高阶反射π(**r**-eflective **h**-igher **o**-rder π-calculus,简写为rho-演算)，引入反射作为其核心模型的一部分。它提供了两个基本原语，反射和修改，允许正在进行的计算将进程转变为一个通道，将一个从进程修改后得到的信通转变回它所修改的进程。该模型在过去的十年间经历过多次同行评审。原型系统已有将近十年的历史，清晰地展现出其健壮性。它采用总数达到了9个的合约构建原语集合，远远少于以太坊智能合约语言Solidity，然而这个模型比Solidity更具表达能力。特别是基于Solidity的智能合约不具备内在并发的能力。 从更狭隘的角度来看，观察到Scala在语言设计之后艰难地添加元编程特性的教训是很有用的。在Scala中的反射甚至在好几年间都不是线程安全。可以说，这次教训，再加上类型系统的问题，都是其设计之初不定的编译器和新语言设计的原因。这些以及其他经过深入探索的努力清楚地表明，从编程语言的核心设计开始时就提供元编程模型原语，对其寿命和实际应用都是很重要的。简而言之，一个实际上支持元编程的设计在想要获得与Java，C#或者Scala等同的生产完备特性的项目中更具成本效应。 RChain智能合约模型 Rosette在作用域和优雅性上的成果令人瞩目。尤其是，Rosette把一个actor分解为 信道语义的单元处理就是在SpecialK栈研究中的亮点。首先，它将信道访问映射到for-comprehension风格的单元结构化的响应式编程。其次，它将信道同时映射到与整个节点相关的本地存储，以及节点之间的基于AMQP服务提供商的通信基础设施中的队列。这提供了内容传送网络的基础，该网络可以在通信节点的网络上实现，其与基于π演算的编程模型集成。特别地，从以上代码的注释中可以看出，信道加模式的单元化对待统一了消息传递和内容交付编程范式。具体来说，信道可以被看作是主题提供者，而模式为消息流提供了嵌套的子主题结构。这整合了所有的标准内容寻址机制（例如URL + http），同时提供了一个查询模型。详细信息请参见下面的章节。 接下来的三个表示进程的自然并发情况、信道创建和递归情形。 π演算捕获了基于消息传递交互来构建的并发计算的核心模型。它在并发和分布式计算中所扮演的角色，就像lambda演算在函数式语言和函数式编程所扮演的一样，给出了计算的基本本质，并将其转化为可以执行计算的语法和语义。给出一些信道的概念，它构建起了一些基本的进程公式，其中前三个是关于I/O的，描述了消息传递的行为。 接着注意到统一可作为匹配和分解树的一种自然的算法，基于统一的匹配和分解为查询提供了基础。 这些基本公式可以用元组空间里面的操作来模拟: 这给出了一个非常自然的解释： 正如rholang设计中所规定的的那样，这是一个用于智能合约的RChain模型的前身。它为构造合约提供了迄今为止最丰富的通信原语集合，这是由理论和工业规模的开发和部署所共同推动的。然而，整套合约原语适合在一条线上。从基于PoW的区块链到EVM，在这个领域没有一个单一设计方案能够承受这个方案所经受的质量保证压力。具体来说，这个方案在所有使用Rosette、Tuplespaces和BizTalk的经验中都有所取舍，并将它们归结为一个单一的设计方案，该方案满足所有这些场景中发现的迫切需求。它只有七个原语，并且与当前市场的主要编程范例相符。然而，作为来自rholang规范的例子，以及用行为类型显示来防止 DAO bug的研究，现有区块链技术中可表达的全部合约范围都能够在此模型中被紧凑地表达。 这只是故事的开始。通过反射，我们允许信道的名称自身也是结构，比如上面例子中的x。这允许我们通过命名空间来细分存储资源的空间。命名空间是从安全到分片的各种特性的基础。 这一点值得更详细的讨论。虽然π演算确实解决了actor模型的主要端口约束，但它并不为fork-join模式提供自然的语法和语义支持。π演算的一些变体，例如连接演算，已经被提出来解决这种困境，但可以说，这些提议深受一些特性纠缠，使得它们不适用于许多分布式和去中心化编程设计模式。同时，通道的单元解释提供了π演算语义中更为集中和基本的重构，这些与模型中所有现有的标志语义相一致，提供了fork-join的自然概念，同时也清晰地映射到响应式编程范式，从而使诸如Apache Spark等开发栈的集成相对简单。 这引起了关于如何发布持久化数据的问题，以及进程阻塞等待元组空间中不存在的键值对时会发生什么情况的问题。此外，元组空间机制对编程模型没有任何限定。使用元组空间的代理可以用各种各样编程模型来编写，这些编程模型对并发语义具有各种实现和解释器。这使得在由许多代理通过元组空间进行交互的应用程序中进行端到端语义的推理变得尤其困难。然而，模型在沟通和协调上的简单性已经引起了广泛的关注，在随后的几十年里，业界诞生了很多关于元组的实现。 这个重构出现在Meredith和Stay关于π演算的高阶范畴论语义的工作 :cite:`DBLP:journals/corr/StayM15` 中，之后在rholang设计中加入。需要注意的重要一点是，基于for-comprehension的输入现在可以平滑地扩展到来自多个源的输入，在继续被调用之前，每个或所有这些输入都必须通过一个过滤器过滤。 简单地总结一下：Rosette不仅仅是结构上和程序上的反射，更是词法上的反射。也就是说，Rosette程序中的所有句法结构也都是actor！反射式的底层构造为干净的宏系统、嵌入式领域特定语言以及其他语法和符号处理特性提供了基础，而这些是许多工业语言在Rosette完成20年后还难以提供的特性。 Tomlinson，Lavender和Meredith等人提供了Rosette/ESS中的元组空间模型的实现，作为进行两种模型研究的手段，并比较两种风格所写出来的应用程序。正是在这项工作中，Meredith开始了对移动进程演算的深入研究，并把他作为actor模型和元组空间模型的第三个替代方案。主要需求之一是在具有一个统一的编程模型（如Rosette的actor模型）之间建立桥梁，通过元组空间模型提供的简单但灵活的通信和协调概念，使应用语义的推理变得更加容易。 传统的数据库操作 经典的消息操作 元组空间 使用for-comprehension允许单元化使用的信道可以使用输入守护语义来规范参数，因此特定的join语义可以多形地提供。这个意义怎么强调都不为过。特别是: 我们现在有一个嵌套事务的语法形式。具体来说：:code:`P` 只能在满足与输入源状态变更和条件相符的上下文中运行。此外， :code:`P` 可以是另一个输入守护进程。因此程序员或程序分析器可以 *按语法* 来检测事务的边界。这对涉及金融和其他关键任务的事务的合约至关重要。 当这些被置于并发执行中，我们有 尽管单元抽象提供了在信道上用于内容流流动的结构，但更基本的观察提供了支持工业级元编程的必要结构。我们知道几乎所有的主要编程语言都支持元级编程。原因很简单，程序员不写程序，程序编写程序，程序员编写写程序的程序。这就是为何能在互联网规模上完成如此巨大的编程任务的原因，使用计算机尽可能地自动完成任务。从文本编辑器到编译器，到代码生成器，到AI，这些都是生产出互联网规模上运行的服务代码的基本生态系统的一部分。 加上J-Y Girard的线性逻辑的发明，我们可以看到命题即类型范式的一个具体扩展。通过线性逻辑，我们看到了范围涵盖远远超过严格串行的函数式模型。类型检查所提供的作用范围从属性证明扩展到并发环境下的协议一致性检查。接着，Caires和Cardelli发现了空间逻辑，其进一步扩展了作用范围，包括程序内部形态的结构化属性。在这些发现的基础上，Stay和Meredith确定了一个算法，即LADL算法，来生成类型系统，带来了一系列从安全性、可用性到安全性质的结构化和行为化的特性。通过应用Stay和Meredith开发的LADL算法，这里介绍的无类型的合约原语模型被赋予了一个完备的类型系统，它足以提供一些编译时保护措施，保证处理金融财产和其他敏感内容的关键任务所要求的关键的安全性和可用性。一个在编译时安全守护的简单例子是足以在编译时去发现和防止在The DAO事件中引起5千万美元损失的bug。 一份形式化规范 一个邮箱(一个接受actor客户端消息的队列) 元信息(描述如何通过更抽象的关键字访问状态值) 将形式化规范渲染为能工作的代码 一个状态(许多值组成的元组) 以及一个共享的行为对象(一个从消息类型到响应时需要运行的代码的映射，大致相当于C++语言中的虚函数表) 消费者 易失性的-data 易失性的-k get 它决定了一份构建时正确的虚拟机的形式化规范 它有一个健全和正确的类型系统 持久化-data 持久性的-k 生产者 publish publish with history put read store subscribe 这决定了一个清晰的编译策略，一系列构建时正确的到虚拟机字节码的转换规则，该虚拟机已经被现场测试了多达20年之久。 其中for-comprehension是使用延续单元的语法糖。这条成功的解析表明了对解释器中**源**的重构。 它被求解为 :code:`P{ X := c, Y := d }`，也就是说，我们在某个环境中开始执行 :code:`P`，在该环境中 :code:`X` 被绑定为 :code:`c` ， :code:`Y` 被绑定为 :code:`d` 。我们用符号写下求解过程: 