package nosi.core.webapp.helpers.datehelper;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.YearMonth;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.time.temporal.Temporal;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.LongStream;

import nosi.core.webapp.Core;

/**
 * william.fonseca 26/05/2021
 */
public final class IGRPDaysOff {

	private final Set<LocalDate> daysOff;

	public IGRPDaysOff() {
		this.daysOff = new HashSet<>();
	}

	/**
	 * Include a date object in the dayOff string. If is null, than it will be
	 * ignored.
	 * 
	 * @param <T>
	 * @param date
	 * @return this, for chaining, not null
	 */
	public <T extends Temporal> IGRPDaysOff from(T date) {
		this.addToSet(date);
		return this;
	}

	/**
	 * Include a list of date objects in the dayOff string. The null objects will be
	 * ignored.
	 * 
	 * @param <T>
	 * @param dates the dates to include in the dayOff string.
	 * @return this, for chaining, not null
	 */
	public <T extends Temporal> IGRPDaysOff from(List<T> dates) {
		this.addToSet(dates);
		return this;
	}

	/**
	 * Include a list of date objects corresponding of the {@link Month} provided as
	 * parameter, since the start to the end of the month, for the current year.
	 * 
	 * @param <T>
	 * @param month the month
	 * @return this, for chaining, not null
	 */
	public IGRPDaysOff from(Month month) {
		YearMonth yearMonth = YearMonth.of(LocalDate.now().getYear(), month);
		return this.from(yearMonth);
	}

	/**
	 * Include a list of date objects corresponding of the {@link YearMonth}
	 * provided as parameter.
	 * 
	 * @param <T>
	 * @param month the yearMonth
	 * @return this, for chaining, not null
	 */
	public IGRPDaysOff from(YearMonth yearMonth) {
		return this.from(yearMonth.atDay(1), yearMonth.atEndOfMonth());
	}

	/**
	 * Method intend to provide a period to be add to the string daysOff.
	 * <p>
	 * If {@code startDateInclusive} or {@code endDateInclusive} are null, or if the
	 * start date is greater than the end date, the period will be ignored.
	 * 
	 * @param <T>
	 * @param startDateInclusive the start date
	 * @param endDateInclusive   the end date
	 * @return this, for chaining, not null
	 */
	public <T extends Temporal> IGRPDaysOff from(T startDateInclusive, T endDateInclusive) {

		if (Objects.isNull(startDateInclusive) || Objects.isNull(endDateInclusive))
			return this;

		final LocalDate start = this.getLocalDate(startDateInclusive);
		final LocalDate end = this.getLocalDate(endDateInclusive);

		if (start.isAfter(end))
			return this;

		final long numberOfDaysBetween = ChronoUnit.DAYS.between(start, end);

		// NumberOfDaysBetween plus 1 to include the end date
		LongStream.range(0, numberOfDaysBetween + 1).mapToObj(start::plusDays).forEach(this::addToSet);

		return this;
	}

	private <T extends Temporal> void addToSet(List<T> dates) {
		if (Objects.nonNull(dates))
			dates.forEach(this::addToSet);
	}

	private <T extends Temporal> void addToSet(T date) {
		if (Objects.nonNull(date))
			this.daysOff.add(this.getLocalDate(date));
	}

	private <T extends Temporal> LocalDate getLocalDate(T date) {
		if (this.isInstant(date))
			return LocalDateTime.ofInstant((Instant) date, ZoneId.systemDefault()).toLocalDate();
		return LocalDate.from(date);
	}

	private <T extends Temporal> boolean isInstant(T dateObj) {
		return dateObj.getClass().isAssignableFrom(Instant.class);
	}

	/**
	 * This method builds the String with the dates. This is a terminal operation.
	 * <p>
	 * The dates will be formated using this format {@code dd-MM-yyyy}, and ordered
	 * in ascending order.
	 * 
	 * @return a String representing the dates or an empty String if there are no
	 *         dates to be included.
	 */
	public String build() {
		
		if (this.daysOff.isEmpty())
			return "";

		final String DAYSOFF_SEPARATOR = ",";
		final DateTimeFormatter formatter = DateTimeFormatter.ofPattern(Core.DD_MM_YYYY);

		return this.daysOff.stream().sorted()
				.map(date -> date.format(formatter))
				.collect(Collectors.joining(DAYSOFF_SEPARATOR));
	}

}
