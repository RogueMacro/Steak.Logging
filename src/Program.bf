using System;

namespace Steak.Logging
{
	class Program
	{
		static void Main()
		{
			Logger log = scope .("MyLogger", "MS(%e) NAME(%n) LEVEL(%l) MESSAGE(%x)");

			for (int i = 0; i < 100; ++i)
				log.Warning("Hey! {}", 1);

			Console.In.Read();
		}
	}
}
