using System;

namespace Steak.Logging
{
	public class Logger : ILogger
	{
		public this() : base()
		{}

		public this(String name, LogLevel level = .Debug) : base(name, level)
		{}

		public this(String name, String format, LogLevel level = .Debug) : base(name, format, level)
		{}

		public override void Log(LogLevel level, StringView str, params Object[] args)
		{
			if ((int) level < (int) MinimumLogLevel)
				return;

			let originalColor = Console.ForegroundColor;
			Console.ForegroundColor = level.Color;

			String message = scope .();
			Formatting.Format(this, level, message, str, params args);

			Console.WriteLine(message);

			Console.ForegroundColor = originalColor;
		}
	}
}
