using System;

namespace Steak.Logging
{
	public class ConsoleLogger : StreamLogger
	{
		public this() : base(Console.Out) {}
		public this(StringView name, LogLevel level = .Trace) : base(Console.Out, name, level) {}
		public this(StringView name, StringView format, LogLevel level = .Trace) : base(Console.Out, name, format, level) {}

		protected override void Log(ConsoleColor color, StringView message)
		{
			let originalColor = Console.ForegroundColor;
			Console.ForegroundColor = color;
			Console.WriteLine(message);
			Console.ForegroundColor = originalColor;
		}
	}
}
