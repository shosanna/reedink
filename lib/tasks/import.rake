task :import_data => :environment do
  data = [["Towards native higher-order remote procedure calls","Olle Fredriksson Dan R. Ghica Bertram Wheen","12","http://www.cs.bham.ac.uk/~drg/papers/ifl14.pdf"],
          ["The Genuine Sieve of Eratosthenes","Melissa E. O’Neill","12","http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf"],
          ["Learn Physics by Programming in Haskell","Scott N. Walck","11","http://arxiv.org/pdf/1412.4880v1.pdf"],
          ["You and Your Research","Richard Hamming","10","http://www.cs.virginia.edu/~robins/YouAndYourResearch.html"],
          ["The Humble Programmer","Edsger W. Dijkstra","5","https://www.cs.utexas.edu/~EWD/transcriptions/EWD03xx/EWD340.html"],
          ["On the cruelty of really teaching computing science","Edsger W. Dijkstra","7","https://www.cs.utexas.edu/~EWD/transcriptions/EWD10xx/EWD1036.html"],
          ["Reflections on Trusting Trust","Ken Thompson","3","https://www.ece.cmu.edu/~ganger/712.fall02/papers/p761-thompson.pdf"],
          ["The Geometry of Innocent Flesh on the Bone: Return-into-libc without Function Calls (on the x86)","Hovav Shacham","30","https://cseweb.ucsd.edu/~hovav/dist/geometry.pdf"],
          ["A History of Haskell: Being Lazy With Class","Philip Wadler","55","http://research.microsoft.com/en-us/um/people/simonpj/papers/history-of-haskell/history.pdf"],
          ["Jak zrychlovat programy?","Jakub Cerny","14","http://kam.mff.cuni.cz/~kuba/ka/jak_zrychlovat.pdf"],
          ["Left-Leaning Red-Black Trees","Robert Sedgewick","78","http://www.cs.princeton.edu/~rs/talks/LLRB/08Penn.pdf"],
          ["Upstart Intro, Cookbook and Best Practises","Ubuntu","100"],
          ["What Every Programmer Should Know About Memory","Ulrich Drepper","104"],
          ["Use of Formal Methods at Amazon Web Services","Chris Newcombe, Tim Rath, Fan Zhang, Bogdan Munteanu, Marc Brooker, Michael Deardeuff Amazon.com","12"],
          ["Základní grafové algoritmy","Jakub Černý","204"],
          ["Finding Files Fast","James A. Woods","3"],
          ["Propositions as Types","Philip Wadler","13"],
          ["TEX pro pragmatiky","Petr Olsak","140"],
          ["Cache-Oblivious Algorithms and Data Structures","Erik D. Demaine","29"],
          ["Datové struktury","Václav Koubek","87"],
          ["No Silver Bullet - Essence and Accident in Software Engineering","Frederick P. Brooks, Jr.","16"],
          ["Finally Tagless, Partially Evaluated Tagless Staged Interpreters for Simpler Typed Languages","Jacques Carette, Oleg Kiselyov and Chung-chieh Shan","36"],
          ["Mathematica programming: an advanced introduction","Leonid Shifrin","408"],
          ["Introduction to algorithms","Thomas H. Cormen","1292"],
          ["An essential guide to LATEX 2ε usage - Obsolete commands and packages","Mark Trettin","22"],
          ["Avoid eqnarray!","Lars Madsen","10"],
          ["Short Math Guide for LATEX","Michael Downes","17"],
          ["User’s Guide for the amsmath Package","American Mathematical Society","40"],
          ["The Limits of Quantum","Scott Aaronson","8"],
          ["The Art of Computer Programming - volume 3","Donald E. Knuth","782"],
          ["The Euler Virtual Math Fonts for use with LaTeX","Walter Schmidt","6"],
          ["Automatic synthesis of typed Λ-programs on term algebras","Corrado Böhm, Alessandro Berarducci","19"],
          ["iOS Games by tutorials","Ray Wanderlich","799"],
          ["How Linux Works","Brian Ward","366"],
          ["The Art of R Programming","Norman Matloff","373"],
          ["Land of Lisp","Conrad Barski","400"],
          ["The Art of Prolog","Ehud Sterling Leon, Shapiro","552"]]

  data.each do |item|
    Book.create!(title: item[0], author: item[1], pages: item[2], url: item[3])
  end
end
