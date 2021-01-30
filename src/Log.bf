using System;
using System.Collections;

namespace Steak.Logging
{
	/*
	- Formatting -
	-----------------------------------
	| Token | Formatted to | Example  |
	-----------------------------------
	| %t    | Time         | 11:42:34 |
	-----------------------------------
	| %h    | Hours        | 11       |
	-----------------------------------
	| %m    | Minutes      | 42       |
	-----------------------------------
	| %s    | Seconds      | 34       |
	-----------------------------------
	| %e    | Milliseconds |          |
	-----------------------------------
	| %y    | Year         | 2020     |
	-----------------------------------
	| %o    | Month        | January  |
	-----------------------------------
	| %d    | Day of week  | Monday   |
	-----------------------------------
	| %a    | Day of month | 21th     |
	-----------------------------------
	| %n    | Logger name  | MyLogger |
	-----------------------------------
	| %x    | Message      |          |
	-----------------------------------
	| %l    | Log level    | Warning  |
	-----------------------------------
	*/
	public static class Log
	{
		public static ConsoleColor TraceColor = .Gray;
		public static ConsoleColor InfoColor = .White;
		public static ConsoleColor WarningColor = .Yellow;
		public static ConsoleColor ErrorColor = .Red;
		public static ConsoleColor SuccessColor = .Green;

		public static readonly String DefaultFormat = new String("[%t] [%l] %x") ~ delete _;

		private static List<LoggerRegistration> Loggers = new .() ~ DeleteContainerAndItems!(_);

		public static void InitConsoleLog(LogLevel level = .Info)
		{
			Loggers.Add(new .(new ConsoleLogger("Log", level), true));
		}

		public static void AddLogger(ILogger logger, bool ownsLogger)
		{
			Loggers.Add(new .(logger, ownsLogger));
		}

		public static void Log(LogLevel level, StringView format, params Object[] args)
		{
			for (var logger in Loggers)
				logger.Logger.Log(level, format, args);
		}

		public static void FatalErrorF(StringView format, params Object[] args)
		{
			var message = scope String()..AppendF(format, params args);
			Runtime.FatalError(message);
		}

		public static void FatalError(String message, String CallerFilePath = Compiler.CallerFilePath, int CallerLineNum = Compiler.CallerLineNum)
		{
			scope ConsoleLogger().Error(message);
			Runtime.FatalError(message, CallerFilePath, CallerLineNum);
		}

		[Inline] public static void Trace(StringView format, params Object[] args) => Log(.Trace, format, params args);
		[Inline] public static void Info(StringView format, params Object[] args) => Log(.Info, format, params args);
		[Inline] public static void Warning(StringView format, params Object[] args) => Log(.Warning, format, params args);
		[Inline] public static void Error(StringView format, params Object[] args) => Log(.Error, format, params args);
		[Inline] public static void Success(StringView format, params Object[] args) => Log(.Success, format, params args);

		private class LoggerRegistration
		{
			public ILogger Logger ~ if (mOwnsLogger) delete _;

			private bool mOwnsLogger;

			public this(ILogger logger, bool ownsLogger)
			{
				Logger = logger;
				mOwnsLogger = ownsLogger;
			}
		}
	}
}
