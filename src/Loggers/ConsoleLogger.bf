using System;

namespace Steak.Logging
{
	public class ConsoleLogger : StreamLogger
	{
		public this(StringView name = "", StringView format = "", LogLevel level = .Default, String moduleName = Compiler.CallerProject) : base(Console.Out, name, format, level, false, moduleName) {}

		protected override void Log(ConsoleColor color, StringView message)
		{
			let originalColor = Console.ForegroundColor;
			Console.ForegroundColor = color;
			Console.WriteLine(message);
			Console.ForegroundColor = originalColor;
		}
	}
}
