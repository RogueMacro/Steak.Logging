using System;

namespace Steak.Logging
{
	public class FileLogger	: ILogger
	{
		public this() : base()
		{}

		public this(String name, LogLevel level = .Debug) : base(name, level)
		{}

		public this(String name, String format, LogLevel level = .Debug) : base(name, format, level)
		{}

		public override void Log(LogLevel level, StringView str, params Object[] args)
		{
			let logger = scope Logger();
			logger.Error("FileLogger not implemented");
		}
	}
}
